/* Copyright (c) 2021 vesoft inc. All rights reserved.
 *
 * This source code is licensed under Apache 2.0 License,
 * attached with Common Clause Condition 1.0, found in the LICENSES directory.
 */

#include "executor/query/JoinExecutor.h"

#include "planner/Query.h"
#include "context/QueryExpressionContext.h"
#include "context/Iterator.h"

namespace nebula {
namespace graph {

Status JoinExecutor::checkInputDataSets() {
    auto* join = asNode<Join>(node());
    auto leftVar = join->left()->outputVar();
    lhsIter_ = ectx_->getVersionedResult(leftVar, join->leftVarVersion()).iter();
    DCHECK(!!lhsIter_);
    VLOG(1) << "lhs: " << leftVar << " " << lhsIter_->size();
    if (lhsIter_->isGetNeighborsIter() || lhsIter_->isDefaultIter()) {
        std::stringstream ss;
        ss << "Join executor does not support " << lhsIter_->kind();
        return Status::Error(ss.str());
    }
    auto rightVar = join->right()->outputVar();
    rhsIter_ = ectx_->getVersionedResult(rightVar, join->rightVarVersion()).iter();
    DCHECK(!!rhsIter_);
    VLOG(1) << "rhs: " << rightVar << " " << rhsIter_->size();
    if (rhsIter_->isGetNeighborsIter() || rhsIter_->isDefaultIter()) {
        std::stringstream ss;
        ss << "Join executor does not support " << rhsIter_->kind();
        return Status::Error(ss.str());
    }
    colSize_ = join->colNames().size();
    return Status::OK();
}

void JoinExecutor::buildHashTable(
    const std::vector<Expression*>& hashKeys,
    Iterator* iter,
    std::unordered_map<List, std::vector<const Row*>>& hashTable) const {
    QueryExpressionContext ctx(ectx_);
    for (; iter->valid(); iter->next()) {
        List list;
        list.values.reserve(hashKeys.size());
        for (auto& col : hashKeys) {
            Value val = col->eval(ctx(iter));
            list.values.emplace_back(std::move(val));
        }

        auto& vals = hashTable[list];
        vals.emplace_back(iter->row());
    }
}

void JoinExecutor::buildSingleKeyHashTable(
    Expression* hashKey,
    Iterator* iter,
    std::unordered_map<Value, std::vector<const Row*>>& hashTable) const {
    QueryExpressionContext ctx(ectx_);
    for (; iter->valid(); iter->next()) {
        auto& val = hashKey->eval(ctx(iter));

        auto& vals = hashTable[val];
        vals.emplace_back(iter->row());
    }
}

}  // namespace graph
}  // namespace nebula
