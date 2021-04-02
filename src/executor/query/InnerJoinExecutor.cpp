/* Copyright (c) 2021 vesoft inc. All rights reserved.
 *
 * This source code is licensed under Apache 2.0 License,
 * attached with Common Clause Condition 1.0, found in the LICENSES directory.
 */

#include "executor/query/InnerJoinExecutor.h"
#include <event2/event_struct.h>

#include "context/Iterator.h"
#include "context/QueryExpressionContext.h"
#include "planner/Query.h"
#include "util/ScopedTimer.h"

namespace nebula {
namespace graph {
folly::Future<Status> InnerJoinExecutor::execute() {
    SCOPED_TIMER(&execTime_);
    NG_RETURN_IF_ERROR(checkInputDataSets());
    return join();
}

Status InnerJoinExecutor::close() {
    exchange_ = false;
    return Executor::close();
}

folly::Future<Status> InnerJoinExecutor::join() {
    auto* join = asNode<Join>(node());
    DataSet result;
    result.colNames = join->colNames();

    if (lhsIter_->empty() || rhsIter_->empty()) {
        return finish(ResultBuilder().value(Value(std::move(result))).finish());
    }

    if (hasSingleKey()) {
        result = doJoin<Value>(join);
    } else {
        result = doJoin<List>(join);
    }
    return finish(ResultBuilder().value(Value(std::move(result))).finish());
}

template <typename T>
DataSet InnerJoinExecutor::doJoin(const Join* join) {
    auto bucketSize = lhsIter_->size() > rhsIter_->size() ? rhsIter_->size() : lhsIter_->size();
    std::unordered_map<T, std::vector<const Row*>> hashTable;
    hashTable.reserve(bucketSize);
    if (lhsIter_->size() < rhsIter_->size()) {
        buildHashTable(join->hashKeys(), lhsIter_.get(), hashTable);
        return probe(join->probeKeys(), rhsIter_.get(), hashTable);
    } else {
        exchange_ = true;
        buildHashTable(join->probeKeys(), rhsIter_.get(), hashTable);
        return probe(join->hashKeys(), lhsIter_.get(), hashTable);
    }
}

template <typename T>
DataSet InnerJoinExecutor::probe(
    const std::vector<Expression*>& probeKeys,
    Iterator* probeIter,
    const std::unordered_map<T, std::vector<const Row*>>& hashTable) const {
    DataSet ds;
    QueryExpressionContext ctx(ectx_);
    ds.rows.reserve(probeIter->size());
    for (; probeIter->valid(); probeIter->next()) {
        auto val = Evaluable<T>::eval(probeKeys, probeIter, &ctx);
        buildNewRow<T>(hashTable, val, *probeIter->row(), ds);
    }
    return ds;
}

template <class T>
void InnerJoinExecutor::buildNewRow(const std::unordered_map<T, std::vector<const Row*>>& hashTable,
                                    const T& val,
                                    const Row& rRow,
                                    DataSet& ds) const {
    const auto& range = hashTable.find(val);
    if (range == hashTable.end()) {
        return;
    }
    for (auto* row : range->second) {
        auto& lRow = *row;
        Row newRow;
        newRow.reserve(lRow.size() + rRow.size());
        auto& values = newRow.values;
        if (exchange_) {
            values.insert(values.end(),
                    std::make_move_iterator(rRow.values.begin()),
                    std::make_move_iterator(rRow.values.end()));
            values.insert(values.end(), lRow.values.begin(), lRow.values.end());
        } else {
            values.insert(values.end(), lRow.values.begin(), lRow.values.end());
            values.insert(values.end(),
                    std::make_move_iterator(rRow.values.begin()),
                    std::make_move_iterator(rRow.values.end()));
        }
        ds.rows.emplace_back(std::move(newRow));
    }
}
}   // namespace graph
}   // namespace nebula
