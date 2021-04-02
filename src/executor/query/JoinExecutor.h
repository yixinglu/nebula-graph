/* Copyright (c) 2021 vesoft inc. All rights reserved.
 *
 * This source code is licensed under Apache 2.0 License,
 * attached with Common Clause Condition 1.0, found in the LICENSES directory.
 */

#ifndef EXECUTOR_QUERY_JOINEXECUTOR_H_
#define EXECUTOR_QUERY_JOINEXECUTOR_H_

#include "executor/Executor.h"

#include "context/QueryExpressionContext.h"

namespace nebula {
namespace graph {

class JoinExecutor : public Executor {
public:
    JoinExecutor(const std::string& name, const PlanNode* node, QueryContext* qctx)
        : Executor(name, node, qctx) {}

    Status checkInputDataSets();

protected:
    using Rows = std::vector<const Row*>;

    template <typename T>
    void buildHashTable(const std::vector<Expression*>& hashKeys,
                        Iterator* iter,
                        std::unordered_map<T, Rows>& hashTable) const;

    bool hasSingleKey() const;

    template <typename T>
    struct Evaluable;

    std::unique_ptr<Iterator>                          lhsIter_;
    std::unique_ptr<Iterator>                          rhsIter_;
    size_t                                             colSize_{0};
};

template <>
struct JoinExecutor::Evaluable<List> {
    static auto eval(const std::vector<Expression*>& probeKeys,
                     Iterator* probeIter,
                     QueryExpressionContext* ctx) -> List {
        List list;
        list.values.reserve(probeKeys.size());
        for (auto& col : probeKeys) {
            Value val = col->eval((*ctx)(probeIter));
            list.values.emplace_back(std::move(val));
        }
        return list;
    }
};

template <>
struct JoinExecutor::Evaluable<Value> {
    static auto eval(const std::vector<Expression*>& probeKeys,
                     Iterator* probeIter,
                     QueryExpressionContext* ctx) -> Value {
        return probeKeys.front()->eval((*ctx)(probeIter));
    }
};

template <typename T>
void JoinExecutor::buildHashTable(const std::vector<Expression*>& hashKeys,
                                  Iterator* iter,
                                  std::unordered_map<T, Rows>& hashTable) const {
    QueryExpressionContext ctx(ectx_);
    for (; iter->valid(); iter->next()) {
        auto list = Evaluable<T>::eval(hashKeys, iter, &ctx);
        auto& vals = hashTable[list];
        vals.emplace_back(iter->row());
    }
}

}  // namespace graph
}  // namespace nebula
#endif
