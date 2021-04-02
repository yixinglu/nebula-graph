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
    lhsIter_ = ectx_->getVersionedResult(join->leftVar().first, join->leftVar().second).iter();
    DCHECK(!!lhsIter_);
    VLOG(1) << "lhs: " << join->leftVar().first << " " << lhsIter_->size();
    if (lhsIter_->isGetNeighborsIter() || lhsIter_->isDefaultIter()) {
        std::stringstream ss;
        ss << "Join executor does not support " << lhsIter_->kind();
        return Status::Error(ss.str());
    }
    rhsIter_ =
        ectx_->getVersionedResult(join->rightVar().first, join->rightVar().second).iter();
    DCHECK(!!rhsIter_);
    VLOG(1) << "rhs: " << join->rightVar().first << " " << rhsIter_->size();
    if (rhsIter_->isGetNeighborsIter() || rhsIter_->isDefaultIter()) {
        std::stringstream ss;
        ss << "Join executor does not support " << rhsIter_->kind();
        return Status::Error(ss.str());
    }
    colSize_ = join->colNames().size();
    return Status::OK();
}

bool JoinExecutor::hasSingleKey() const {
    auto join = asNode<Join>(node());
    auto& hashKeys = join->hashKeys();
    auto& probeKeys = join->probeKeys();
    DCHECK_EQ(hashKeys.size(), probeKeys.size());
    return hashKeys.size() == 1 && probeKeys.size() == 1;
}

}  // namespace graph
}  // namespace nebula
