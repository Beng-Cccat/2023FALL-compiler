#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include "Operand.h"
#include "Type.h"

class SymbolEntry;
class Unit;
class Function;
class BasicBlock;
class Instruction;
class IRBuilder;

// 语法分析树节点
class Node
{
private:
    // 静态变量，所有节点序号
    static int counter;
    // 节点序号
    int seq;
    Node *next = nullptr;

protected:
    // 两个综合属性：跳转目标未确定的基本块链表（也就是所有之后需要回填的块）？
    // true_list：无条件跳转和条件跳转指令为真时跳转的基本块
    std::vector<BasicBlock **> true_list;
    // false_list：条件跳转指令为假时跳转的基本块
    std::vector<BasicBlock **> false_list;
    // builder用于传递继承属性，静态变量
    static IRBuilder *builder;
    // 回填函数
    void backPatch(std::vector<BasicBlock **> &list, BasicBlock *target);
    // 合并函数
    std::vector<BasicBlock **> merge(std::vector<BasicBlock **> &list1, std::vector<BasicBlock **> &list2);

public:
    Node();
    int getSeq() const { return seq; };
    static void setIRBuilder(IRBuilder *ib)
    {
        fprintf(stderr, "哈哈 Node->setirbuilder start\n");
        builder = ib;
        fprintf(stderr, "哈哈 Node->setirbuilder over\n");
    };
    virtual void output(int level) = 0;
    virtual void typeCheck(Type *retType = nullptr) = 0;
    virtual void genCode() = 0;
    std::vector<BasicBlock **> &trueList() { return true_list; }
    std::vector<BasicBlock **> &falseList() { return false_list; }
    Node *getnext()
    {
        return next;
    }
    void setnext(Node *node)
    {
        Node *temp = this;
        while (temp->getnext())
        {
            temp = temp->getnext();
        }
        temp->next = node;
    }
};

// 表达式节点
class ExprNode : public Node
{
private:
    int kind;

protected:
    // kind的类型
    enum
    {
        EXPR,
        IMPLICTCASTEXPR,
        UNARYEXPR
    };

    SymbolEntry *symbolEntry;
    // 子树的结果被存储在dst中
    Operand *dst; // The result of the subtree is stored into dst.

    Type *type;

public:
    ExprNode(SymbolEntry *symbolEntry, int kind = EXPR) : kind(kind), symbolEntry(symbolEntry)
    {
        // wjw
        type = TypeSystem::intType;
    };
    Operand *getOperand() { return dst; };
    SymbolEntry *getSymPtr() { return symbolEntry; };
    virtual int getValue() { return -1; };

    // 判断kind类型
    bool isExpr() const { return kind == EXPR; };
    bool isImplictCastExpr() const { return kind == IMPLICTCASTEXPR; };
    bool isUnaryExpr() const { return kind == UNARYEXPR; };

    // 得到type类型
    virtual Type *getType() { return type; };

    // 定义虚函数
    virtual void typeCheck(Type *retType = nullptr) { return; };

    void genCode();
    void output(int level);
};

// 二元表达式节点
class BinaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr1, *expr2;

public:
    enum
    {
        ADD,
        SUB,
        MUL,
        DIV,
        MOD,
        XOR,
        AND,
        OR,
        LESS,
        LE,
        GREATER,
        GE,
        EQU,
        NE
    };
    // ffc
    BinaryExpr(SymbolEntry *se, int op, ExprNode *expr1, ExprNode *expr2);
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
    int getValue();
};

// 整数到bool的隐式类型转换
//  int to bool
// TODO
class ImplictCastExpr : public ExprNode
{
private:
    ExprNode *expr;

public:
    ImplictCastExpr(ExprNode *expr) : ExprNode(nullptr, IMPLICTCASTEXPR), expr(expr)
    {
        type = TypeSystem::boolType;
        dst = new Operand(new TemporarySymbolEntry(type, SymbolTable::getLabel()));
    };
    void output(int level);
    ExprNode *getExpr() const { return expr; };
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

// 一元表达式节点
class UnaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr;

public:
    enum
    {
        NOT,
        SUB
    };
    UnaryExpr(SymbolEntry *se, int op, ExprNode *expr);
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
    int getValue();

    int getOp() const { return op; };
    void setType(Type *type) { this->type = type; }
};

// 函数调用
class CallExpr : public ExprNode
{
private:
    ExprNode *param;

public:
    CallExpr(SymbolEntry *se, ExprNode *param = nullptr);
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

class Constant : public ExprNode
{
public:
    Constant(SymbolEntry *se) : ExprNode(se)
    {
        dst = new Operand(se);
        type = TypeSystem::intType;
    };
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
    int getValue();
};

class Id : public ExprNode
{
public:
    Id(SymbolEntry *se) : ExprNode(se)
    {
        if (se)
        {
            type = se->getType();
            if (type->isInt())
            {
                SymbolEntry *temp = new TemporarySymbolEntry(
                    TypeSystem::intType, SymbolTable::getLabel());
                dst = new Operand(temp);
            }
        }
    };
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
    int getValue();
};

// 表达式节点
class StmtNode : public Node
{
private:
    int kind;

protected:
    enum
    {
        IF,
        IFELSE,
        WHILE,
        COMPOUND,
        RETURN
    };

public:
    StmtNode(int kind = -1) : kind(kind){};
    bool isIf() const { return kind == IF; };
    virtual void typeCheck(Type *retType = nullptr) = 0;
};

class BlankStmt : public StmtNode
{
public:
    BlankStmt(){};
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

class CompoundStmt : public StmtNode
{
private:
    StmtNode *stmt;

public:
    CompoundStmt(StmtNode *stmt = nullptr) : stmt(stmt){};
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

class SeqNode : public StmtNode
{
private:
    StmtNode *stmt1, *stmt2;

public:
    SeqNode(StmtNode *stmt1, StmtNode *stmt2) : stmt1(stmt1), stmt2(stmt2){};
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

class DeclStmt : public StmtNode
{
private:
    Id *id;
    ExprNode *expr;

public:
    DeclStmt(Id *id, ExprNode *expr = nullptr) : id(id), expr(expr){};
    Id *getId() { return id; };
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

class IfStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;

public:
    IfStmt(ExprNode *cond, StmtNode *thenStmt) : cond(cond), thenStmt(thenStmt)
    {
        fprintf(stderr, "bbbbbb进ifstmt并且size=%d\n", cond->getType()->getSize());
        if (cond->getType()->isInt() && cond->getType()->getSize() == 32)
        {
            ImplictCastExpr *temp = new ImplictCastExpr(cond);
            fprintf(stderr, "shizhege2隐式类型转换int->bool\n");
            this->cond = temp;
        }
    };
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

class IfElseStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
    StmtNode *elseStmt;

public:
    IfElseStmt(ExprNode *cond, StmtNode *thenStmt, StmtNode *elseStmt) : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt)
    {
        if (cond->getType()->isInt())
        {
            fprintf(stderr, "想不到吧我是int\n");
        }
        if (cond->getType()->getSize() == 32)
        {
            fprintf(stderr, "想不到吧我size是32\n");
        }
        if (cond->getType()->isInt() && cond->getType()->getSize() == 32)
        {
            ImplictCastExpr *temp = new ImplictCastExpr(cond);
            fprintf(stderr, "shizhege1隐式类型转换int->bool\n");
            this->cond = temp;
        }
    };
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

class BreakStmt : public StmtNode
{
private:
    StmtNode *whileStmt;

public:
    BreakStmt(StmtNode *whilestmt) : whileStmt(whilestmt){};
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

class ContinueStmt : public StmtNode
{
private:
    StmtNode *whileStmt;

public:
    ContinueStmt(StmtNode *whilestmt) : whileStmt(whilestmt){};
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

class ReturnStmt : public StmtNode
{
private:
    ExprNode *retValue;

public:
    ReturnStmt(ExprNode *retValue = nullptr) : retValue(retValue){};
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
    ExprNode *getretValue() { return retValue; }
};

class AssignStmt : public StmtNode
{
private:
    // 左值
    ExprNode *lval;
    ExprNode *expr;

public:
    AssignStmt(ExprNode *lval, ExprNode *expr);
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

// 函数定义
class FunctionDef : public StmtNode
{
private:
    SymbolEntry *se;
    // 函数的声明部分，包括参数列表或函数内部的变量声明
    DeclStmt *decl;
    // 函数的主体部分，即函数体内的各种语句
    StmtNode *stmt;
    ReturnStmt *ret;

public:
    FunctionDef(SymbolEntry *se, DeclStmt *decl, StmtNode *stmt) : se(se), decl(decl), stmt(stmt){};
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
    void setRet(ReturnStmt *ret) { this->ret = ret; }
    SymbolEntry *getSymPtr() { return se; };
};

class ExprStmt : public StmtNode
{
private:
    ExprNode *expr;

public:
    ExprStmt(ExprNode *expr) : expr(expr){};
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
};

// ff
class WhileStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *stmt;
    BasicBlock *cond_bb;
    BasicBlock *end_bb;

public:
    WhileStmt(ExprNode *cond, StmtNode *stmt = nullptr) : cond(cond), stmt(stmt)
    {
        if (cond->getType()->isInt() && cond->getType()->getSize() == 32)
        {
            ImplictCastExpr *temp = new ImplictCastExpr(cond);
            fprintf(stderr, "shizheg3隐式类型转换int->bool\n");
            this->cond = temp;
        }
    };
    void output(int level);
    void typeCheck(Type *retType = nullptr);
    void genCode();
    BasicBlock *get_condbb() { return cond_bb; };
    BasicBlock *get_endbb() { return end_bb; };
    void setStmt(StmtNode *stmt) { this->stmt = stmt; };
};

class Ast
{
private:
    Node *root;

public:
    Ast() { root = nullptr; }
    void setRoot(Node *n) { root = n; }
    void output();
    void typeCheck();
    void genCode(Unit *unit);
};

#endif
