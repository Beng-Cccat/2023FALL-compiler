#ifndef __TYPE_H__
#define __TYPE_H__
#include <vector>
#include <string>
#include "SymbolTable.h"

class Type
{
private:
    int kind;
    // 种类编号
protected:
    enum
    {
        INT,
        VOID,
        FUNC,
        PTR,
        FLOAT
    };
    int size;

public:
    Type(){};
    Type(int kind, int size = 0) : kind(kind), size(size){};
    virtual ~Type(){};
    virtual std::string toStr() = 0;
    bool isInt() const { return kind == INT; };
    bool isVoid() const { return kind == VOID; };
    bool isFunc() const { return kind == FUNC; };
    bool isFloat() const { return kind == FLOAT; };

    void setSize(int size)
    {
        this->size = size;
    }
    int getKind() const { return kind; };
    int getSize() const { return size; };
};

class FloatType : public Type
{
private:
    int size;

public:
    FloatType(int size) : Type(Type::FLOAT), size(size){};
    std::string toStr();
};

class IntType : public Type
{
private:
    bool constant;

public:
    IntType(int size, bool constant = false) : Type(Type::INT), constant(constant)
    {
        setSize(size);
    };
    std::string toStr();
    bool isConst() const { return constant; };
};

class VoidType : public Type
{
public:
    VoidType() : Type(Type::VOID){};
    std::string toStr();
};

class FunctionType : public Type
{
private:
    Type *returnType;
    std::vector<Type *> paramsType;
    std::vector<SymbolEntry *> paramsSe;

public:
    FunctionType(Type *returnType, std::vector<Type *> paramsType, std::vector<SymbolEntry *> paramsSe) : Type(Type::FUNC), returnType(returnType), paramsType(paramsType), paramsSe(paramsSe){};
    void setParamsType(std::vector<Type *> paramsType)
    {
        this->paramsType = paramsType;
    };
    Type *getRetType() { return returnType; };
    std::string toStr();
    //
    std::vector<Type *> getParamsType() { return paramsType; };
    std::vector<SymbolEntry *> getParamsSe() { return paramsSe; };
};

// 指针类型
class PointerType : public Type
{
private:
    Type *valueType;

public:
    PointerType(Type *valueType) : Type(Type::PTR) { this->valueType = valueType; };
    std::string toStr();
};

class TypeSystem
{
private:
    static IntType commonInt;
    static IntType commonBool;
    static VoidType commonVoid;
    static FloatType commonFloat;
    static IntType commonConstInt;

public:
    static Type *intType;
    static Type *voidType;
    static Type *boolType;
    static Type *floatType;
    static Type *constIntType;
};

#endif
