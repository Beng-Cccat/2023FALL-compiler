#include "Type.h"
#include <sstream>

IntType TypeSystem::commonInt = IntType(32);
IntType TypeSystem::commonBool = IntType(1);
VoidType TypeSystem::commonVoid = VoidType();
FloatType TypeSystem::commonFloat = FloatType(8);
IntType TypeSystem::commonConstInt = IntType(32, true);

Type *TypeSystem::intType = &commonInt;
Type *TypeSystem::voidType = &commonVoid;
Type *TypeSystem::boolType = &commonBool;
Type *TypeSystem::floatType = &commonFloat;
Type *TypeSystem::constIntType = &commonConstInt;

std::string FloatType::toStr()
{
    return "float";
}

std::string IntType::toStr()
{
    std::ostringstream buffer;
    buffer << "i" << size;
    return buffer.str();
}

std::string VoidType::toStr()
{
    return "void";
}

std::string FunctionType::toStr()
{
    std::ostringstream buffer;
    // buffer << returnType->toStr() << "()";
    buffer << returnType->toStr() << "(";
    for (auto it = paramsType.begin(); it != paramsType.end(); it++)
    {
        buffer << (*it)->toStr();
        if (it + 1 != paramsType.end())
            buffer << ", ";
    }
    buffer << ')';
    return buffer.str();
}

std::string PointerType::toStr()
{
    std::ostringstream buffer;
    buffer << valueType->toStr() << "*";
    return buffer.str();
}
