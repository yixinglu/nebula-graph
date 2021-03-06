/* Copyright (c) 2020 vesoft inc. All rights reserved.
 *
 * This source code is licensed under Apache 2.0 License,
 * attached with Common Clause Condition 1.0, found in the LICENSES directory.
 */

#include "planner/Query.h"

#include <folly/String.h>

#include "common/interface/gen-cpp2/graph_types.h"
#include "util/ToJson.h"

using folly::stringPrintf;

namespace nebula {
namespace graph {

std::unique_ptr<cpp2::PlanNodeDescription> Explore::explain() const {
    auto desc = SingleInputNode::explain();
    addDescription("space", folly::to<std::string>(space_), desc.get());
    addDescription("dedup", util::toJson(dedup_), desc.get());
    addDescription("limit", folly::to<std::string>(limit_), desc.get());
    auto filter = filter_.empty() ? filter_ : Expression::decode(filter_)->toString();
    addDescription("filter", filter, desc.get());
    addDescription("orderBy", folly::toJson(util::toJson(orderBy_)), desc.get());
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> GetNeighbors::explain() const {
    auto desc = Explore::explain();
    addDescription("src", src_ ? src_->toString() : "", desc.get());
    addDescription("edgeTypes", folly::toJson(util::toJson(edgeTypes_)), desc.get());
    addDescription("edgeDirection",
                   storage::cpp2::_EdgeDirection_VALUES_TO_NAMES.at(edgeDirection_),
                   desc.get());
    addDescription(
        "vertexProps", vertexProps_ ? folly::toJson(util::toJson(*vertexProps_)) : "", desc.get());
    addDescription(
        "edgeProps", edgeProps_ ? folly::toJson(util::toJson(*edgeProps_)) : "", desc.get());
    addDescription(
        "statProps", statProps_ ? folly::toJson(util::toJson(*statProps_)) : "", desc.get());
    addDescription("exprs", exprs_ ? folly::toJson(util::toJson(*exprs_)) : "", desc.get());
    addDescription("random", util::toJson(random_), desc.get());
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> GetVertices::explain() const {
    auto desc = Explore::explain();
    addDescription("src", src_ ? src_->toString() : "", desc.get());
    addDescription("props", folly::toJson(util::toJson(props_)), desc.get());
    addDescription("exprs", folly::toJson(util::toJson(exprs_)), desc.get());
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> GetEdges::explain() const {
    auto desc = Explore::explain();
    addDescription("src", src_ ? src_->toString() : "", desc.get());
    addDescription("type", util::toJson(type_), desc.get());
    addDescription("ranking", ranking_ ? ranking_->toString() : "", desc.get());
    addDescription("dst", dst_ ? dst_->toString() : "", desc.get());
    addDescription("props", folly::toJson(util::toJson(props_)), desc.get());
    addDescription("exprs", folly::toJson(util::toJson(exprs_)), desc.get());
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> IndexScan::explain() const {
    auto desc = Explore::explain();
    // TODO
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> Filter::explain() const {
    auto desc = SingleInputNode::explain();
    addDescription("condition", condition_ ? condition_->toString() : "", desc.get());
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> Project::explain() const {
    auto desc = SingleInputNode::explain();
    addDescription("columns", cols_ ? cols_->toString() : "", desc.get());
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> Sort::explain() const {
    auto desc = SingleInputNode::explain();
    addDescription("factors", folly::toJson(util::toJson(factors_)), desc.get());
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> Limit::explain() const {
    auto desc = SingleInputNode::explain();
    addDescription("offset", folly::to<std::string>(offset_), desc.get());
    addDescription("count", folly::to<std::string>(count_), desc.get());
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> Aggregate::explain() const {
    auto desc = SingleInputNode::explain();
    addDescription("groupKeys", folly::toJson(util::toJson(groupKeys_)), desc.get());
    folly::dynamic itemArr = folly::dynamic::array();
    for (const auto &item : groupItems_) {
        folly::dynamic itemObj = folly::dynamic::object();
        itemObj.insert("distinct", util::toJson(item.distinct));
        itemObj.insert("funcType", static_cast<uint8_t>(item.func));
        itemObj.insert("expr", item.expr ? item.expr->toString() : "");
        itemArr.push_back(itemObj);
    }
    addDescription("groupItems", folly::toJson(itemArr), desc.get());
    return desc;
}
std::unique_ptr<cpp2::PlanNodeDescription> SwitchSpace::explain() const {
    auto desc = SingleInputNode::explain();
    addDescription("space", spaceName_, desc.get());
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> DataCollect::explain() const {
    auto desc = SingleDependencyNode::explain();
    addDescription("inputVars", folly::toJson(util::toJson(inputVars_)), desc.get());
    switch (collectKind_) {
        case CollectKind::kSubgraph: {
            addDescription("kind", "subgraph", desc.get());
            break;
        }
        case CollectKind::kRowBasedMove: {
            addDescription("kind", "row", desc.get());
            break;
        }
        case CollectKind::kMToN: {
            addDescription("kind", "m to n", desc.get());
            break;
        }
    }
    return desc;
}

std::unique_ptr<cpp2::PlanNodeDescription> DataJoin::explain() const {
    auto desc = SingleDependencyNode::explain();
    addDescription("leftVar", folly::toJson(util::toJson(leftVar_)), desc.get());
    addDescription("rightVar", folly::toJson(util::toJson(rightVar_)), desc.get());
    addDescription("hashKeys", folly::toJson(util::toJson(hashKeys_)), desc.get());
    addDescription("probeKeys", folly::toJson(util::toJson(probeKeys_)), desc.get());
    return desc;
}

}   // namespace graph
}   // namespace nebula
