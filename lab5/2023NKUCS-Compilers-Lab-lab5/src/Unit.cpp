#include "Unit.h"
#include "Type.h"

extern FILE *yyout;

// 将函数f添加到函数链表的最后一个元素
void Unit::insertFunc(Function *f)
{
    func_list.push_back(f);
}

// 添加全局变量
void Unit::insertGlobal(SymbolEntry *se)
{
    global_list.push_back(se);
}

// 插入定义
void Unit::insertDeclare(SymbolEntry *se)
{
    fprintf(stderr, "插入了一个declare");
    // 使用 std::find 函数在 declare_list 容器中查找与 se 相等的元素
    // 如果没有的话返回最后一个值（end），通过这个来判断是否有该元素（是否该插入）
    auto it = std::find(declare_list.begin(), declare_list.end(), se);
    if (it == declare_list.end())
    {
        fprintf(stderr, "插进去了插进去了over\n");
        declare_list.push_back(se);
    }
    // 确保名为 se 的元素不存在于 declare_list 容器中。如果不存在，则将其添加到容器末尾
}

// 从链表中移除所选函数
void Unit::removeFunc(Function *func)
{
    func_list.erase(std::find(func_list.begin(), func_list.end(), func));
}

void Unit::output() const
{
    for (auto se : global_list)
    {
        // 如果类型是int的话
        if (se->getType()->isInt())
            fprintf(yyout, "%s = global %s %d, align 4\n", se->toStr().c_str(),
                    se->getType()->toStr().c_str(),
                    ((IdentifierSymbolEntry *)se)->getValue());
    }

    for (auto &func : func_list)
        func->output();
    int i = 0;
    fprintf(stderr, "准备！我要进了！");
    for (auto se : declare_list)
    // se是symbolentry*类型
    {
        fprintf(stderr, "进来了%d次\n", i);
        FunctionType *type = (FunctionType *)(se->getType());
        // FunctionType中有一个type*类型变量
        std::string str = type->toStr();
        fprintf(stderr, "function:%s\n", str.c_str());
        // 提取从索引 0 开始直到找到的 ( 之前的子字符串
        std::string name = str.substr(0, str.find('('));
        // 提取从括号 ( 开始到字符串结尾的子字符串
        std::string param = str.substr(str.find('('));
        fprintf(yyout, "declare %s %s%s\n", type->getRetType()->toStr().c_str(), se->toStr().c_str(), param.c_str());
    }
}

Unit::~Unit()
{
    auto delete_list = func_list;
    for (auto &func : delete_list)
        delete func;

    auto delete_global = global_list;
    for (auto &se : global_list)
        delete se;
}
