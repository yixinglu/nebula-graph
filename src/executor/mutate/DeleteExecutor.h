/* Copyright (c) 2020 vesoft inc. All rights reserved.
 *
 * This source code is licensed under Apache 2.0 License,
 * attached with Common Clause Condition 1.0, found in the LICENSES directory.
 */

#ifndef EXECUTOR_MUTATE_DELETEVERTICESEXECUTOR_H_
#define EXECUTOR_MUTATE_DELETEVERTICESEXECUTOR_H_

#include "executor/QueryStorageExecutor.h"

namespace nebula {
namespace graph {

class DeleteVerticesExecutor final : public QueryStorageExecutor {
public:
    DeleteVerticesExecutor(const PlanNode *node, QueryContext *qctx)
        : QueryStorageExecutor("DeleteVerticesExecutor", node, qctx) {}

    folly::Future<Status> execute() override;

private:
    folly::Future<Status> deleteVertices();
};

class DeleteEdgesExecutor final : public QueryStorageExecutor {
public:
    DeleteEdgesExecutor(const PlanNode *node, QueryContext *qctx)
        : QueryStorageExecutor("DeleteEdgesExecutor", node, qctx) {}

    folly::Future<Status> execute() override;

private:
    folly::Future<Status> deleteEdges();
    Status prepareEdgeKeys(const EdgeType edgeType, const EdgeKeys *edgeKeys);
};
}   // namespace graph
}   // namespace nebula

#endif   // EXECUTOR_MUTATE_DELETEVERTICESEXECUTOR_H_
