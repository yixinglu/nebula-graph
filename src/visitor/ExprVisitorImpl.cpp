/* Copyright (c) 2020 vesoft inc. All rights reserved.
 *
 * This source code is licensed under Apache 2.0 License,
 * attached with Common Clause Condition 1.0, found in the LICENSES directory.
 */

#include "visitor/ExprVisitorImpl.h"

namespace nebula {
namespace graph {

void ExprVisitorImpl::visit(UnaryExpression *expr) {
    DCHECK(ok());
    expr->operand()->accept(this);
}

void ExprVisitorImpl::visit(TypeCastingExpression *expr) {
    DCHECK(ok());
    expr->operand()->accept(this);
}

// binary expression
void ExprVisitorImpl::visit(ArithmeticExpression *expr) {
    visitBinaryExpr(expr);
}

void ExprVisitorImpl::visit(RelationalExpression *expr) {
    visitBinaryExpr(expr);
}

void ExprVisitorImpl::visit(SubscriptExpression *expr) {
    visitBinaryExpr(expr);
}

void ExprVisitorImpl::visit(AttributeExpression *expr) {
    visitBinaryExpr(expr);
}

void ExprVisitorImpl::visit(LogicalExpression *expr) {
    visitBinaryExpr(expr);
}

void ExprVisitorImpl::visit(LabelAttributeExpression *expr) {
    DCHECK(ok());
    const_cast<LabelExpression *>(expr->left())->accept(this);
    if (ok()) {
        const_cast<LabelExpression *>(expr->right())->accept(this);
    }
}

// function call
void ExprVisitorImpl::visit(FunctionCallExpression *expr) {
    DCHECK(ok());
    for (const auto &arg : expr->args()->args()) {
        arg->accept(this);
        if (!ok()) {
            break;
        }
    }
}

// container expression
void ExprVisitorImpl::visit(ListExpression *expr) {
    DCHECK(ok());
    for (auto item : expr->items()) {
        const_cast<Expression *>(item)->accept(this);
        if (!ok()) {
            break;
        }
    }
}

void ExprVisitorImpl::visit(SetExpression *expr) {
    DCHECK(ok());
    for (auto item : expr->items()) {
        const_cast<Expression *>(item)->accept(this);
        if (!ok()) {
            break;
        }
    }
}

void ExprVisitorImpl::visit(MapExpression *expr) {
    DCHECK(ok());
    for (auto &pair : expr->items()) {
        const_cast<Expression *>(pair.second)->accept(this);
        if (!ok()) {
            break;
        }
    }
}

void ExprVisitorImpl::visitBinaryExpr(BinaryExpression *expr) {
    DCHECK(ok());
    expr->left()->accept(this);
    if (ok()) {
        expr->right()->accept(this);
    }
}

}   // namespace graph
}   // namespace nebula
