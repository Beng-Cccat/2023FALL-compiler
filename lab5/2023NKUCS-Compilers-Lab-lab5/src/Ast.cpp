#include "Ast.h"
#include "SymbolTable.h"
#include "Unit.h"
#include "Instruction.h"
#include "IRBuilder.h"
#include <string>
#include "Type.h"
#include <stack>
#include <cassert>

extern FILE *yyout;
extern Unit unit;

int Node::counter = 0;
// 传递继承属性，如新生成的指令要插入的基本块，辅助进行中间代码生成
IRBuilder *Node::builder = nullptr;

Node::Node()
{
    seq = counter++;
}

// 回填
// 将target作为跳转指令插入list所指链表中的指令
void Node::backPatch(std::vector<BasicBlock **> &list, BasicBlock *target)
{
    int i = 0;
    for (auto &bb : list)
    {
        *bb = target;
        fprintf(stderr, "你行不行%d\n", i++);
    }
}

// 合并两个基本块
std::vector<BasicBlock **> Node::merge(std::vector<BasicBlock **> &list1, std::vector<BasicBlock **> &list2)
{
    std::vector<BasicBlock **> res(list1);
    res.insert(res.end(), list2.begin(), list2.end());
    return res;
}

// binaryexpr构造函数
BinaryExpr::BinaryExpr(SymbolEntry *se, int op, ExprNode *expr1, ExprNode *expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2)
{
    // 创建存储dst
    fprintf(stderr, "start operand\n");
    dst = new Operand(se);
    fprintf(stderr, "operand\n");
    std::string op_str;
    switch (op)
    {
    case ADD:
        op_str = "+";
        break;
    case SUB:
        op_str = "-";
        break;
    case MUL:
        op_str = "*";
        break;
    case DIV:
        op_str = "/";
        break;
    case MOD:
        op_str = "%";
        break;
    case AND:
        op_str = "&&";
        break;
    case OR:
        op_str = "||";
        break;
    case LESS:
        op_str = "<";
        break;
    case LE:
        op_str = "<=";
        break;
    case GREATER:
        op_str = ">";
        break;
    case GE:
        op_str = ">=";
        break;
    case EQU:
        op_str = "==";
        break;
    case NE:
        op_str = "!=";
        break;
    }
    // ff:类型判断没c

    if (expr1->getType()->isVoid() || expr2->getType()->isVoid())
    {
        fprintf(stderr, "operand类型错误,void不能参与%s双目运算\n", op_str.c_str());
    }

    if (op >= BinaryExpr::AND && op <= BinaryExpr::NE)
    {
        type = TypeSystem::boolType;
        if (op == BinaryExpr::AND || op == BinaryExpr::OR)
        {
            if (expr1->getType()->isInt() && expr1->getType()->getSize() == 32)
            {
                fprintf(stderr, "我劝你你不要进来，不然我会嘎你\n");
                ImplictCastExpr *temp = new ImplictCastExpr(expr1);
                fprintf(stderr, "shizheg4隐式类型转换int->bool\n");
                this->expr1 = temp;
            }
            if (expr2->getType()->isInt() && expr2->getType()->getSize() == 32)
            {
                fprintf(stderr, "我劝你你不要进来，不然我会嘎你11\n");
                ImplictCastExpr *temp = new ImplictCastExpr(expr2);
                fprintf(stderr, "shizheg5隐式类型转换int->bool\n");
                this->expr2 = temp;
            }
        }
    }
    else
        type = TypeSystem::intType;
    fprintf(stderr, "over3\n");
};

// 生成单元的中间代码
void Ast::genCode(Unit *unit)
{
    fprintf(stderr, "哈哈 gencode AST\n");
    fprintf(stderr, "哈哈 ast->gencode->irbuilder start\n");
    IRBuilder *builder = new IRBuilder(unit);
    fprintf(stderr, "哈哈 ast->gencode->irbuilder over1\n");
    Node::setIRBuilder(builder);
    fprintf(stderr, "哈哈 ast->gencode->irbuilder over1\n");
    root->genCode();
}

// 函数定义的中间代码
void FunctionDef::genCode()
{
    fprintf(stderr, "哈哈 gencode funcdef\n");
    Unit *unit = builder->getUnit();
    Function *func = new Function(unit, se);
    // 找到函数基本块的入口点
    BasicBlock *entry = func->getEntry();
    // set the insert point to the entry basicblock of this function.
    // 指示当前要插入的是这个函数
    builder->setInsertBB(entry);

    // stmt->genCode();

    if (decl)
    {
        decl->genCode();
    }
    if (stmt)
    {
        stmt->genCode();
    }

    /**
     * Construct control flow graph. You need do set successors and predecessors for each basic block.
     * Todo
     */
    fprintf(stderr, "到这里了但是不进去吗\n");
    // 遍历函数的基本块
    for (auto block = func->begin(); block != func->end(); block++)
    {
        fprintf(stderr, "instruction1-start\n");
        Instruction *i = (*block)->begin();
        fprintf(stderr, "ins1-over & ins2-start\n");
        Instruction *last = (*block)->rbegin();
        fprintf(stderr, "ins2-over\n");
        while (i != last)
        {
            // 检查指令 i 是否是条件或无条件跳转指令
            if (i->isCond() || i->isUncond())
            {
                (*block)->remove(i);
            }
            i = i->getNext();
        }
        // 简化控制流图，提高分析效率

        if (last->isCond())
        {
            BasicBlock *true_bb, *false_bb;
            true_bb = dynamic_cast<CondBrInstruction *>(last)->getTrueBranch();
            false_bb = dynamic_cast<CondBrInstruction *>(last)->getFalseBranch();
            if (true_bb->empty())
            {
                fprintf(stderr, "functiondef->cond->true_bb->empty\n");
                if (false_bb->empty())
                    fprintf(stderr, "functiondef->cond->false_bb->empty\n");
                if (((FunctionType *)(se->getType()))->getRetType() == TypeSystem::intType)
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), true_bb);
                else if (((FunctionType *)(se->getType()))->getRetType() == TypeSystem::voidType)
                    new RetInstruction(nullptr, true_bb);
            }
            else if (false_bb->empty())
            {
                fprintf(stderr, "functiondef->cond->false_bb->empty\n");
                if (((FunctionType *)(se->getType()))->getRetType() == TypeSystem::intType)
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), false_bb);
                else if (((FunctionType *)(se->getType()))->getRetType() == TypeSystem::voidType)
                    new RetInstruction(nullptr, false_bb);
            }
            (*block)->addSucc(true_bb);
            (*block)->addSucc(false_bb);
            true_bb->addPred(*block);
            false_bb->addPred(*block);
        }
        else if (last->isUncond())
        {
            BasicBlock *branch = dynamic_cast<UncondBrInstruction *>(last)->getBranch();
            (*block)->addSucc(branch);
            branch->addPred(*block);
            if (branch->empty())
            {
                fprintf(stderr, "functiondef->uncond->branch->empty\n");
                if (((FunctionType *)(se->getType()))->getRetType() == TypeSystem::intType)
                    new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), branch);
                else if (((FunctionType *)(se->getType()))->getRetType() == TypeSystem::voidType)
                    new RetInstruction(nullptr, branch);
            }
        }
        else if (!last->isRet())
        {
            if (((FunctionType *)(se->getType()))->getRetType() == TypeSystem::intType)
                new RetInstruction(new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), *block);
            else if (((FunctionType *)(se->getType()))->getRetType() == TypeSystem::voidType)
            {
                new RetInstruction(nullptr, *block);
            }
        }
    }
}

// 二元表达式生成中间代码
void BinaryExpr::genCode()
{
    fprintf(stderr, "哈哈 gencode binary\n");
    BasicBlock *bb = builder->getInsertBB();
    Function *func = bb->getParent();
    // 与运算 && (需要全对才进入最终true分支)
    if (op == AND)
    {
        // 挖坑，创建bb，后续父节点可以指定真分支
        BasicBlock *trueBB = new BasicBlock(func); // if the result of lhs is true, jump to the trueBB.
        // 先生成表达式1的中间代码
        expr1->genCode();
        // 回填表达式1的真分支（没什么用，相当于空的）
        backPatch(expr1->trueList(), trueBB);
        // 插入这部分指令
        builder->setInsertBB(trueBB); // set the insert point to the trueBB so that intructions generated by expr2 will be inserted into it.
        // 再生成表达式2的中间代码
        expr2->genCode();
        // 只考虑了expr2的真分支是因为这是and运算
        // 如果 expr1 是假的，整个条件肯定是假的，而且不需要考虑 expr2 的真分支
        // 但是如果 expr1 是真的，还需要检查 expr2 的真分支，如果 expr2 也是真的，整个条件才被判定为真。
        true_list = expr2->trueList();
        // 错误分支合并
        false_list = merge(expr1->falseList(), expr2->falseList());
    }
    // 或运算，有一个对就进入true分支
    else if (op == OR)
    {
        // Todo:OK
        BasicBlock *trueBB = new BasicBlock(func);
        expr1->genCode();
        backPatch(expr1->falseList(), trueBB);
        builder->setInsertBB(trueBB);
        expr2->genCode();
        true_list = merge(expr1->trueList(), expr2->trueList());
        false_list = expr2->falseList();
    }
    // 比较运算
    else if (op >= LESS && op <= NE)
    {
        // Todo:零扩展？
        expr1->genCode();
        expr2->genCode();
        Operand *src1 = expr1->getOperand();
        Operand *src2 = expr2->getOperand();
        if (src1->getType()->getSize() == 1)
        {
            Operand *dst = new Operand(new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel()));
            new ZextInstruction(dst, src1, bb);
            src1 = dst;
        }
        if (src2->getType()->getSize() == 1)
        {
            Operand *dst = new Operand(new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel()));
            new ZextInstruction(dst, src2, bb);
            src2 = dst;
        }
        // Todo:OK?
        int cmpopcode = -1;
        switch (op)
        {
        case LESS:
            cmpopcode = CmpInstruction::L;
            break;
        case LE:
            cmpopcode = CmpInstruction::LE;
            break;
        case GREATER:
            cmpopcode = CmpInstruction::G;
            break;
        case GE:
            cmpopcode = CmpInstruction::GE;
            break;
        case EQU:
            cmpopcode = CmpInstruction::E;
            break;
        case NE:
            cmpopcode = CmpInstruction::NE;
            break;
        }
        new CmpInstruction(cmpopcode, dst, src1, src2, bb);
        BasicBlock *truebb, *falsebb, *tempbb;
        // 挖坑
        truebb = new BasicBlock(func);
        falsebb = new BasicBlock(func);
        // 空白基本块，用于true跳转指令之后的位置，也就是false指令存储的地方
        tempbb = new BasicBlock(func);
        // 啊？ff
        CondBrInstruction *condins = new CondBrInstruction(truebb, tempbb, dst, bb);
        UncondBrInstruction *uncondins = new UncondBrInstruction(falsebb, tempbb);
        // 将需要回填的块加入list
        true_list.push_back(condins->patchBranchTrue());
        false_list.push_back(uncondins->patchBranch());
    }
    else if (op >= ADD && op <= MOD)
    {
        expr1->genCode();
        expr2->genCode();
        fprintf(stderr, "就是这俩的gencode结束了\n");
        Operand *src1 = expr1->getOperand();
        Operand *src2 = expr2->getOperand();
        fprintf(stderr, "哈哈 然后呢\n");
        int opcode = -1;
        switch (op)
        {
        case ADD:
            opcode = BinaryInstruction::ADD;
            break;
        case SUB:
            opcode = BinaryInstruction::SUB;
            break;
        case MUL:
            opcode = BinaryInstruction::MUL;
            break;
        case DIV:
            opcode = BinaryInstruction::DIV;
            break;
        case MOD:
            opcode = BinaryInstruction::MOD;
            break;
        // ff
        case XOR:
            opcode = BinaryInstruction::XOR;
            break;
        default:
            opcode = -1;
            break;
        }
        new BinaryInstruction(opcode, dst, src1, src2, bb);
        fprintf(stderr, "这个instruction？\n");
    }
}

void Constant::genCode()
{
    // we don't need to generate code.
    fprintf(stderr, "哈哈 gencode Constant\n");
}

void Id::genCode()
{
    fprintf(stderr, "哈哈 gencode ID\n");
    BasicBlock *bb = builder->getInsertBB();
    Operand *addr = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getAddr();
    new LoadInstruction(dst, addr, bb);
}

// if语句
void IfStmt::genCode()
{
    fprintf(stderr, "哈哈 gencode If start\n");
    Function *func;
    BasicBlock *then_bb, *end_bb;
    fprintf(stderr, "哈哈 gencode If start 1\n");
    func = builder->getInsertBB()->getParent();
    fprintf(stderr, "哈哈 gencode If start 7\n");
    then_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);
    fprintf(stderr, "哈哈 gencode If start 2\n");
    // if判断语句先生成代码
    cond->genCode();
    // 回填
    fprintf(stderr, "哈哈 gencode If start 3\n");
    backPatch(cond->trueList(), then_bb);
    backPatch(cond->falseList(), end_bb);
    fprintf(stderr, "哈哈 gencode If start 4\n");
    // 插入正确分支的语句
    builder->setInsertBB(then_bb);
    thenStmt->genCode();
    if (then_bb->empty())
    {
        fprintf(stderr, "你tm的then_bb是空的\n");
    }
    // 获取指令要插入基本块的位置
    then_bb = builder->getInsertBB();
    fprintf(stderr, "哈哈 gencode If start 5\n");
    // 新建无条件跳转指令(在then之前)
    new UncondBrInstruction(end_bb, then_bb);
    fprintf(stderr, "哈哈 gencode If start 6\n");
    if (then_bb->empty())
    {
        fprintf(stderr, "你tm的then_bb是空的1\n");
    }
    // 后续插入节点为end_bb(end在then之后)
    builder->setInsertBB(end_bb);
    fprintf(stderr, "哈哈 gencode If over\n");
}

void IfElseStmt::genCode()
{
    fprintf(stderr, "哈哈 gencode Ifelse\n");
    // Todo:OK
    Function *func;
    BasicBlock *then_bb, *else_bb, *end_bb;
    func = builder->getInsertBB()->getParent();
    then_bb = new BasicBlock(func);
    else_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);
    // if判断语句生成
    cond->genCode();
    // 回填正确和错误分支
    backPatch(cond->trueList(), then_bb);
    backPatch(cond->falseList(), else_bb);
    // 插入正确分支语句
    builder->setInsertBB(then_bb);
    thenStmt->genCode();
    then_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, then_bb);
    // 插入else分支语句
    builder->setInsertBB(else_bb);
    elseStmt->genCode();
    else_bb = builder->getInsertBB();
    new UncondBrInstruction(end_bb, else_bb);

    builder->setInsertBB(end_bb);
}

// ff:OK
// while语句的cond，true，和end分支都需要记录
void WhileStmt::genCode()
{
    Function *func;
    BasicBlock *cond_bb, *true_bb, *end_bb, *bb;
    func = builder->getInsertBB()->getParent();
    cond_bb = new BasicBlock(func);
    true_bb = new BasicBlock(func);
    end_bb = new BasicBlock(func);
    this->cond_bb = cond_bb;
    this->end_bb = cond_bb;
    bb = builder->getInsertBB();
    // 插入cond语句
    new UncondBrInstruction(cond_bb, bb);
    builder->setInsertBB(cond_bb);
    cond->genCode();
    // 回填
    backPatch(cond->trueList(), true_bb);
    backPatch(cond->falseList(), end_bb);
    // 插入正确分支语句
    builder->setInsertBB(true_bb);
    stmt->genCode();
    true_bb = builder->getInsertBB();
    new UncondBrInstruction(cond_bb, true_bb);
    builder->setInsertBB(end_bb);
}
// Continue:OK
void ContinueStmt::genCode()
{
    BasicBlock *bb = builder->getInsertBB();
    Function *func = bb->getParent();
    new UncondBrInstruction(((WhileStmt *)whileStmt)->get_condbb(), bb);
    BasicBlock *next_bb = new BasicBlock(func);
    builder->setInsertBB(next_bb);
}
// BreakStmt:OK
void BreakStmt::genCode()
{
    Function *func = builder->getInsertBB()->getParent();
    BasicBlock *bb = builder->getInsertBB();
    new UncondBrInstruction(((WhileStmt *)whileStmt)->get_endbb(), bb);
    BasicBlock *next_bb = new BasicBlock(func);
    builder->setInsertBB(next_bb);
}

void CompoundStmt::genCode()
{
    // Todo:OK
    if (stmt)
        stmt->genCode();
}

void SeqNode::genCode()
{
    // Todo:OK
    stmt1->genCode();
    stmt2->genCode();
}

void DeclStmt::genCode()
{
    fprintf(stderr, "哈哈 gencode decl\n");
    // 返回这个id节点的符号表条目
    IdentifierSymbolEntry *se = dynamic_cast<IdentifierSymbolEntry *>(id->getSymPtr());
    if (se->isGlobal())
    {
        // 存储地址信息
        Operand *addr;
        // 存储符号表中的符号条目
        SymbolEntry *addr_se;
        // 初始化符号表条目
        addr_se = new IdentifierSymbolEntry(*se);
        // 设置了addr_se的类型为指向se类型的指针类型
        addr_se->setType(new PointerType(se->getType()));
        // 创建了一个操作数
        addr = new Operand(addr_se);
        // 设置se的地址信息
        se->setAddr(addr);
        // 添加至全局变量中
        unit.insertGlobal(se);
    }
    else if (se->isLocal() || se->isParam()) // ffTODO函数声明
    {
        Function *func = builder->getInsertBB()->getParent();
        // getinsertbb返回当前正在被处理或者正在被插入的代码块
        BasicBlock *entry = func->getEntry();
        fprintf(stderr, "alloca-start\n");
        Instruction *alloca;
        fprintf(stderr, "alloca-over\n");
        Operand *addr;
        SymbolEntry *addr_se;
        Type *type;
        type = new PointerType(se->getType());
        addr_se = new TemporarySymbolEntry(type, SymbolTable::getLabel());
        addr = new Operand(addr_se);
        alloca = new AllocaInstruction(addr, se); // allocate space for local id in function stack.
        entry->insertFront(alloca);               // allocate instructions should be inserted into the begin of the entry block.

        Operand *temp = nullptr;
        if (se->isParam())
            temp = se->getAddr();

        se->setAddr(addr); // set the addr operand in symbol entry so that we can use it in subsequent code generation.

        if (expr)
        {
            BasicBlock *bb = builder->getInsertBB();
            expr->genCode();
            Operand *src = expr->getOperand();
            new StoreInstruction(addr, src, bb);
        }
        if (se->isParam())
        {
            BasicBlock *bb = builder->getInsertBB();
            new StoreInstruction(addr, temp, bb); // 传参
        }
    }

    if (this->getnext())
    {
        this->getnext()->genCode();
    }
}

void ReturnStmt::genCode()
{
    fprintf(stderr, "哈哈 gencode return\n");
    // Todo:OK
    Operand *src = nullptr;
    BasicBlock *bb = builder->getInsertBB();
    if (retValue)
    { // 如果有返回值
        retValue->genCode();
        src = retValue->getOperand();
    }
    new RetInstruction(src, bb);
}

// ff:TODO
void BlankStmt::genCode()
{
}

void ExprNode::genCode()
{
    // Todo
}

// 赋值语句
void AssignStmt::genCode()
{
    fprintf(stderr, "哈哈 gencode assign\n");
    BasicBlock *bb = builder->getInsertBB();
    // 赋值右边表达式生成代码
    expr->genCode();
    // 获取左值符号地址
    Operand *addr = dynamic_cast<IdentifierSymbolEntry *>(lval->getSymPtr())->getAddr();
    Operand *src = expr->getOperand();
    /***
     * We haven't implemented array yet, the lval can only be ID. So we just store the result of the `expr` to the addr of the id.
     * If you want to implement array, you have to caculate the address first and then store the result into it.
     */
    new StoreInstruction(addr, src, bb);
}

// ffc
void ExprStmt::genCode()
{
    expr->genCode();
}

void CallExpr::genCode()
{
    std::vector<Operand *> operands;
    ExprNode *temp = param;
    while (temp)
    {
        temp->genCode();
        operands.push_back(temp->getOperand());
        temp = (ExprNode *)temp->getnext();
    }
    BasicBlock *bb = builder->getInsertBB();
    new CallInstruction(dst, symbolEntry, operands, bb);
}
// Unary一元运算
void UnaryExpr::genCode()
{
    expr->genCode();
    if (op == SUB)
    {
        Operand *src2;
        BasicBlock *bb = builder->getInsertBB();
        Operand *src1 = new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0));
        if (expr->getSymPtr()->getType() == TypeSystem::boolType)
        {
            // 如果是布尔类型，需要进行零扩展
            src2 = new Operand(new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel()));
            new ZextInstruction(src2, expr->getOperand(), bb);
        }
        else
        {
            src2 = expr->getOperand();
        }
        new BinaryInstruction(BinaryInstruction::SUB, dst, src1, src2, bb);
    }
    if (op == NOT)
    {
        BasicBlock *bb = builder->getInsertBB();
        Operand *src = expr->getOperand();
        if (expr->getSymPtr()->getType() == TypeSystem::intType)
        {
            // 如果为int类型需要隐式类型转换
            Operand *temp = new Operand(new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel()));
            new CmpInstruction(CmpInstruction::NE, temp, src, new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), bb);
            src = temp;
        }
        // ff?
        new XorInstruction(dst, src, bb);
    }
}

void ImplictCastExpr::genCode()
{
    expr->genCode();
    BasicBlock *bb = builder->getInsertBB();
    Function *func = bb->getParent();
    BasicBlock *trueBB = new BasicBlock(func);
    BasicBlock *tempbb = new BasicBlock(func);
    BasicBlock *falseBB = new BasicBlock(func);

    fprintf(stderr, "implic->cmpinstruction\n");
    new CmpInstruction(
        CmpInstruction::NE, this->dst, this->expr->getOperand(),
        new Operand(new ConstantSymbolEntry(TypeSystem::intType, 0)), bb);

    CondBrInstruction *condins = new CondBrInstruction(trueBB, tempbb, this->dst, bb);
    UncondBrInstruction *uncondins = new UncondBrInstruction(falseBB, tempbb);

    this->trueList().push_back(condins->patchBranchTrue());
    this->falseList().push_back(uncondins->patchBranch());
}

void Ast::typeCheck()
{
    if (root != nullptr)
        root->typeCheck();
}

void FunctionDef::typeCheck(Type *retType)
{
    SymbolEntry *se = this->getSymPtr();
    Type *dret = ((FunctionType *)(se->getType()))->getRetType();
    Type *sret;
    if (!ret)
    {
        fprintf(stderr, "函数没有return语句\n");
        return;
    }
    else if (ret->getretValue())
        sret = TypeSystem::intType;
    else
        sret = TypeSystem::voidType;
    if (dret != sret)
    {
        fprintf(stderr, "返回值与函数定义不符。函数定义返回值类型为: %s 实际返回类型为: %s\n", dret->toStr().c_str(), sret->toStr().c_str());
    }
    // Todo
}

void BinaryExpr::typeCheck(Type *retType)
{
    // Todo
    Type *type1 = expr1->getSymPtr()->getType();
    Type *type2 = expr2->getSymPtr()->getType();
    if (type1 != type2)
    {
        fprintf(stderr, "type %s and %s mismatch in line xx",
                type1->toStr().c_str(), type2->toStr().c_str());
        if ((type1 == TypeSystem::voidType) || (type2 == TypeSystem::voidType))
        {
            fprintf(stderr, "type %s and %s mismath ", type1->toStr().c_str(), type2->toStr().c_str());
        }
    }
    symbolEntry->setType(type1);
    return;
}

void Constant::typeCheck(Type *retType)
{
    // Todo
    return;
}

void Id::typeCheck(Type *retType)
{
    // Todo
    return;
}

void IfStmt::typeCheck(Type *retType)
{
    // Todo
    if (thenStmt)
        thenStmt->typeCheck(retType);
    return;
}

void IfElseStmt::typeCheck(Type *retType)
{
    // Todo
    if (thenStmt)
        thenStmt->typeCheck(retType);
    if (elseStmt)
        elseStmt->typeCheck(retType);
}

void WhileStmt::typeCheck(Type *retType)
{
    if (stmt)
        stmt->typeCheck(retType);
    // TODO
}

void ContinueStmt::typeCheck(Type *retType)
{
    // TODO
    return;
}

void BreakStmt::typeCheck(Type *retType)
{
    // TODO
    return;
}

void CompoundStmt::typeCheck(Type *retType)
{
    // Todo
    if (stmt)
        stmt->typeCheck(retType);
    return;
}

void SeqNode::typeCheck(Type *retType)
{
    // Todo
    if (stmt1)
        stmt1->typeCheck(retType);
    if (stmt2)
        stmt2->typeCheck(retType);
    return;
}

// ff
void UnaryExpr::typeCheck(Type *retType)
{
    // Todo
    return;
}

void CallExpr::typeCheck(Type *retType)
{
    // Todo
    return;
}

void BlankStmt::typeCheck(Type *retType)
{
    // Todo
    return;
}

void DeclStmt::typeCheck(Type *retType)
{
    // Todo
    return;
}

void ExprStmt::typeCheck(Type *retType)
{
    // Todo
    return;
}

void ReturnStmt::typeCheck(Type *retType)
{
    // Todo
    return;
}

void AssignStmt::typeCheck(Type *retType)
{
    // Todo
    return;
}

void ImplictCastExpr::typeCheck(Type *retType)
{
    return;
}

CallExpr::CallExpr(SymbolEntry *se, ExprNode *param)
    : ExprNode(se), param(param)
{
    dst = nullptr;
    SymbolEntry *s = se;
    int paramCnt = 0;
    ExprNode *temp = param;
    while (temp)
    {
        paramCnt++;
        temp = (ExprNode *)(temp->getnext());
    }
    while (s)
    {
        Type *type = s->getType();
        std::vector<Type *> params = ((FunctionType *)type)->getParamsType();
        if ((long unsigned int)paramCnt == params.size())
        {
            this->symbolEntry = s;
            break;
        }
        s = s->getNext();
    }
    if (symbolEntry)
    {
        Type *type = symbolEntry->getType();
        this->type = ((FunctionType *)type)->getRetType();
        if (this->type != TypeSystem::voidType)
        {
            SymbolEntry *se =
                new TemporarySymbolEntry(this->type, SymbolTable::getLabel());
            dst = new Operand(se);
        }
        std::vector<Type *> params = ((FunctionType *)type)->getParamsType();
        ExprNode *temp = param;
        for (auto it = params.begin(); it != params.end(); it++)
        {
            if (temp == nullptr)
            {
                fprintf(stderr, "传入function%s的参数过少\n",
                        symbolEntry->toStr().c_str());
                break;
            }
            else if ((*it)->getKind() != temp->getType()->getKind())
                fprintf(stderr, "传入参数 %s 无法匹配所需参数 %s\n",
                        temp->getType()->toStr().c_str(),
                        (*it)->toStr().c_str());
            temp = (ExprNode *)(temp->getnext());
        }
        if (temp != nullptr)
        {
            fprintf(stderr, "传参数大于function%s所需参数\n",
                    symbolEntry->toStr().c_str());
        }
    }
    // wjg:不知道sy是什么
    // unit.insertDeclare(se);
    // wj：能插进去，但是没有参数类型，应该是se的问题
    fprintf(stderr, "(IdentifierSymbolEntry *)se)->isSysy()%d\n", ((IdentifierSymbolEntry *)se)->isSysy());
    if (((IdentifierSymbolEntry *)se)->isSysy())
    {
        unit.insertDeclare(se);
    }
}

AssignStmt::AssignStmt(ExprNode *lval, ExprNode *expr) : lval(lval), expr(expr)
{
    Type *type = ((Id *)lval)->getType();
    SymbolEntry *se = lval->getSymPtr();
    if (type->isInt())
    {
        if (((IntType *)type)->isConst())
        {
            fprintf(stderr, "assignstmt左边%s不能是const\n", ((IdentifierSymbolEntry *)se)->toStr().c_str());
        }
    }
    if (!expr->getType()->isInt())
    {
        fprintf(stderr, "int变量等号右边不能是type为\'%s\'的变量\n", expr->getType()->toStr().c_str());
    }
}

void ExprNode::output(int level)
{
    std::string name, type;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    fprintf(yyout, "%*cconst string\ttype:%s\t%s\n", level, ' ', type.c_str(),
            name.c_str());
}

void BinaryExpr::output(int level)
{
    fprintf(stderr, "栓Q binary\n");
    std::string op_str;
    switch (op)
    {
    case ADD:
        op_str = "add";
        break;
    case SUB:
        op_str = "sub";
        break;
    case MUL:
        op_str = "mul";
        break;
    case DIV:
        op_str = "div";
        break;
    case MOD:
        op_str = "mod";
        break;
    case AND:
        op_str = "and";
        break;
    case OR:
        op_str = "or";
        break;
    case LESS:
        op_str = "less";
        break;
    case LE:
        op_str = "lessequal";
        break;
    case GREATER:
        op_str = "greater";
        break;
    case GE:
        op_str = "greaterequal";
        break;
    case EQU:
        op_str = "equal";
        break;
    case NE:
        op_str = "notequal";
        break;
    }
    fprintf(yyout, "%*cBinaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr1->output(level + 4);
    expr2->output(level + 4);
}

void Ast::output()
{
    fprintf(yyout, "program\n");
    fprintf(stderr, "栓Q AST\n");
    if (root != nullptr)
        root->output(4);
}

void Constant::output(int level)
{
    fprintf(stderr, "栓Q Constant\n");
    std::string type, value;
    type = symbolEntry->getType()->toStr();
    value = symbolEntry->toStr();
    fprintf(yyout, "%*cIntegerLiteral\tvalue: %s\ttype: %s\n", level, ' ',
            value.c_str(), type.c_str());
}

void Id::output(int level)
{
    fprintf(stderr, "栓Q ID\n");
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
    fprintf(yyout, "%*cId\tname: %s\tscope: %d\ttype: %s\n", level, ' ',
            name.c_str(), scope, type.c_str());
}

void CompoundStmt::output(int level)
{
    fprintf(yyout, "%*cCompoundStmt\n", level, ' ');
    stmt->output(level + 4);
}

void SeqNode::output(int level)
{
    stmt1->output(level);
    stmt2->output(level);
}

void DeclStmt::output(int level)
{
    fprintf(stderr, "栓Q Decl\n");
    fprintf(yyout, "%*cDeclStmt\n", level, ' ');
    id->output(level + 4);
    if (expr != nullptr)
    {
        expr->output(level + 4);
    }
}

void IfStmt::output(int level)
{
    fprintf(yyout, "%*cIfStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
}

void IfElseStmt::output(int level)
{
    fprintf(stderr, "栓Q Ifelse\n");
    fprintf(yyout, "%*cIfElseStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
    elseStmt->output(level + 4);
}
// ffc
void WhileStmt::output(int level)
{
    fprintf(yyout, "%*cWhileStmt\n", level, ' ');
    cond->output(level + 4);
    stmt->output(level + 4);
}
void BreakStmt::output(int level)
{
    fprintf(yyout, "%*cBreakStmt\n", level, ' ');
}

void ContinueStmt::output(int level)
{
    fprintf(yyout, "%*cContinueStmt\n", level, ' ');
}

void ReturnStmt::output(int level)
{
    fprintf(stderr, "栓Q return\n");
    fprintf(yyout, "%*cReturnStmt\n", level, ' ');
    retValue->output(level + 4);
}

void AssignStmt::output(int level)
{
    fprintf(yyout, "%*cAssignStmt\n", level, ' ');
    lval->output(level + 4);
    expr->output(level + 4);
}

void FunctionDef::output(int level)
{
    fprintf(stderr, "栓Q funcdef\n");
    std::string name, type;
    name = se->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "%*cFunctionDefine function name: %s, type: %s\n", level, ' ',
            name.c_str(), type.c_str());
    if (decl)
    {
        decl->output(level + 4);
    }
    stmt->output(level + 4);
}

void UnaryExpr::output(int level)
{
    std::string op_str;
    switch (op)
    {
    case NOT:
        op_str = "not";
        break;
    case SUB:
        op_str = "minus";
        break;
    }
    fprintf(yyout, "%*cUnaryExpr\top: %s\ttype: %s\n", level, ' ',
            op_str.c_str(), symbolEntry->getType()->toStr().c_str());
    expr->output(level + 4);
}

void CallExpr::output(int level)
{
    std::string name, type;
    int scope;
    if (symbolEntry)
    {
        name = symbolEntry->toStr();
        type = symbolEntry->getType()->toStr();
        scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
        fprintf(yyout, "%*cCallExpr\tfunction name: %s\tscope: %d\ttype: %s\n",
                level, ' ', name.c_str(), scope, type.c_str());
        Node *temp = param;
        while (temp)
        {
            temp->output(level + 4);
            temp = temp->getnext();
        }
    }
}

void BlankStmt::output(int level)
{
    fprintf(yyout, "%*cBlankStmt\n", level, ' ');
}

void ExprStmt::output(int level)
{
    fprintf(yyout, "%*cExprStmt\n", level, ' ');
    expr->output(level + 4);
}

void ImplictCastExpr::output(int level)
{
    fprintf(yyout, "%*cImplictCastExpr\ttype: %s to %s\n", level, ' ',
            expr->getType()->toStr().c_str(), type->toStr().c_str());
    this->expr->output(level + 4);
}

// ffc
int BinaryExpr::getValue()
{
    int value = 0;
    switch (op)
    {
    case ADD:
        value = expr1->getValue() + expr2->getValue();
        break;
    case SUB:
        value = expr1->getValue() - expr2->getValue();
        break;
    case MUL:
        value = expr1->getValue() * expr2->getValue();
        break;
    case DIV:
        value = expr1->getValue() / expr2->getValue();
        break;
    case MOD:
        value = expr1->getValue() % expr2->getValue();
        break;
    case XOR:
        value = expr1->getValue() ^ expr2->getValue();
        break;
    case AND:
        value = expr1->getValue() && expr2->getValue();
        break;
    case OR:
        value = expr1->getValue() || expr2->getValue();
        break;
    case LESS:
        value = expr1->getValue() < expr2->getValue();
        break;
    case LE:
        value = expr1->getValue() <= expr2->getValue();
        break;
    case GREATER:
        value = expr1->getValue() > expr2->getValue();
        break;
    case GE:
        value = expr1->getValue() >= expr2->getValue();
        break;
    case EQU:
        value = expr1->getValue() == expr2->getValue();
        break;
    case NE:
        value = expr1->getValue() != expr2->getValue();
        break;
    }
    return value;
}

UnaryExpr::UnaryExpr(SymbolEntry *se, int op, ExprNode *expr)
    : ExprNode(se, UNARYEXPR), op(op), expr(expr)
{
    std::string op_str = op == UnaryExpr::NOT ? "!" : "-";
    if (expr->getType()->isVoid())
    {
        fprintf(stderr,
                "operand类型错误,void不能参与%s单目运算\n",
                op_str.c_str());
    }
    if (op == UnaryExpr::NOT)
    {
        type = TypeSystem::intType;
        dst = new Operand(se);
        if (expr->isUnaryExpr())
        {
            UnaryExpr *ue = (UnaryExpr *)expr;
            if (ue->getOp() == UnaryExpr::NOT)
            {
                if (ue->getType() == TypeSystem::intType)
                    ue->setType(TypeSystem::boolType);
                // type = TypeSystem::intType;
            }
        }
        // if (expr->getType()->isInt() && expr->getType()->getSize() == 32)
        // {
        //     ImplictCastExpr *temp = new ImplictCastExpr(expr);
        //     this->expr = temp;
        // }
    }
    else if (op == UnaryExpr::SUB)
    {
        type = TypeSystem::intType;
        dst = new Operand(se);
        if (expr->isUnaryExpr())
        {
            UnaryExpr *ue = (UnaryExpr *)expr;
            if (ue->getOp() == UnaryExpr::NOT)
                if (ue->getType() == TypeSystem::intType)
                    ue->setType(TypeSystem::boolType);
        }
    }
};

int UnaryExpr::getValue()
{
    int value = 0;
    switch (op)
    {
    case NOT:
        value = !(expr->getValue());
        break;
    case SUB:
        value = -(expr->getValue());
        break;
    }
    return value;
}

int Constant::getValue()
{
    // assert(symbolEntry->getType()->isInt());
    return ((ConstantSymbolEntry *)symbolEntry)->getValue();
}

int Id::getValue()
{
    // assert(symbolEntry->getType()->isInt());
    return ((IdentifierSymbolEntry *)symbolEntry)->getValue();
}