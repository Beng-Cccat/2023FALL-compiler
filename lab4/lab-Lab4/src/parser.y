%code top{
    #include <iostream>
    #include <assert.h>
    #include "parser.h"
    extern Ast ast;
    int yylex();
    int yyerror( char const * );
}

%code requires {
    #include "Ast.h"
    #include "SymbolTable.h"
    #include "Type.h"
}

%union {
    int itype;
    char* strtype;
    StmtNode* stmttype;
    ExprNode* exprtype;
    Type* type;
    SymbolEntry* se;
    float flotype;
}

%start Program
%token <strtype> ID 
%token <itype> INTEGER
%token <flotype> FLOAT
%token IF ELSE
%token INT VOID
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON
%token ADD SUB OR AND LESS ASSIGN
%token RETURN
%token CONST
%token MUL DIV MOD
%token EQU GE NG NE NOT GT 
%token CHAR
%token WHILE FOR BREAK CONTINUE
%token COMMA DOT FLOAT_DEF
%token LSBRAC RSBRAC SBSAND SBSOR

/* 在parse.h里面定义 StmtNode* stmttype; */
%nterm <stmttype> Stmts Stmt AssignStmt BlockStmt IfStmt ReturnStmt DeclStmt FuncDef ExprStmt WhileStmt BreakStmt ContinueStmt VarDeclStmt ConstDeclStmt VarDef VarDefList FUNCPARAMS PARAMS PARAM ConstDef ConstDefList BlankStmt
%nterm <exprtype> Exp AddExp Cond LOrExp PrimaryExp LVal RelExp LAndExp MulExp EqExp UnaryExp FuncRParams
%nterm <type> Type

%precedence THEN
%precedence ELSE
%%
Program
    : Stmts {
        ast.setRoot($1);
    }
    ;

/* SeqNode 是一个用于表示语句序列（Statements Sequence）的类 */
Stmts
    : Stmt {$$=$1;}
    | Stmts Stmt{
        $$ = new SeqNode($1, $2);
    }
    ;
Stmt
    : AssignStmt {$$=$1;}/* 赋值表达式 */
    | BlockStmt {$$=$1;}/* {}以及里面的部分 */
    | IfStmt {$$=$1;}/* 条件语句 */
    | ReturnStmt {$$=$1;}
    | DeclStmt {$$=$1;}/* 定义语句 */
    | FuncDef {$$=$1;}/* 函数 */
    | ExprStmt{$$=$1;}
    | WhileStmt{$$=$1;}
    | BreakStmt{$$=$1;}
    | ContinueStmt{$$=$1;}
    | BlankStmt {$$=$1;}
    ;

/* 左值表达式 */
LVal
    : ID {
        SymbolEntry *se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        fprintf(stderr, "找到啦！！！！");
        $$ = new Id(se);
        delete []$1;
    }
    ;

/* a=1; */
AssignStmt
    :
    LVal ASSIGN Exp SEMICOLON {
        $$ = new AssignStmt($1, $3);
    }
    ;

/* CompoundStmt 是一个类，用于表示一个代码块，其中包含多个语句 */
/* BlockStmt 代表了一个代码块（Block） */
BlockStmt
    :   LBRACE 
        {identifiers = new SymbolTable(identifiers);} 
        Stmts RBRACE 
        {
            /* 离开代码块时，将符号表还原到之前的状态 */
            $$ = new CompoundStmt($3);
            /* 通过调用 getPrev() 获取上一层的符号表，然后将 top 指向当前的符号表，最后删除 top */
            SymbolTable *top = identifiers;
            identifiers = identifiers->getPrev();
            delete top;
        }
    |
    LBRACE RBRACE
    {
        fprintf(stderr, "空");
        $$=new CompoundStmt(nullptr);
        fprintf(stderr, "空1");
    }
    ;

/* if(a==b)stmt|if(a==b)stmt else stmt */
IfStmt
    : IF LPAREN Cond RPAREN Stmt %prec THEN {
        $$ = new IfStmt($3, $5);
    }
    | IF LPAREN Cond RPAREN Stmt ELSE Stmt {
        $$ = new IfElseStmt($3, $5, $7);
    }
    ;

/* return a; */
ReturnStmt
    :
    RETURN Exp SEMICOLON{
        $$ = new ReturnStmt($2);
    }
    ;

BlankStmt
    : SEMICOLON {
        $$ = new BlankStmt();
    }
    ;

Exp
    :
    AddExp {$$ = $1;}
    ;

/* 判断语句 */
Cond
    :
    LOrExp {$$ = $1;}
    ;

/* PrimaryExp 表示一个表达式的原子部分，即基本表达式 */
PrimaryExp
    :
    LPAREN Exp RPAREN {
        $$ = $2;
    }
    |
    LVal {
        $$ = $1;
    }
    | INTEGER {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, $1);
        printf("kk");
        $$ = new Constant(se);
    }
    | FLOAT {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, $1);
        $$ = new Constant(se);
    }
    ;

UnaryExp 
    : PrimaryExp {$$ = $1;}
    | ID LPAREN FuncRParams RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new CallExpr(se, $3);
    }
    | ID LPAREN RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new CallExpr(se);
    }
    | ADD UnaryExp {$$ = $2;}
    | SUB UnaryExp {
        // 这里用不用temp
        $$ = new UnaryExpr(nullptr, UnaryExpr::SUB, $2);
    }
    | NOT UnaryExp {
        $$ = new UnaryExpr(nullptr, UnaryExpr::NOT, $2);
    }
    ;

MulExp
    : UnaryExp {$$=$1;}
    | MulExp MUL UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MUL, $1, $3);
    }
    | MulExp DIV UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::DIV, $1, $3);
    }
    | MulExp MOD UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MOD, $1, $3);
    }
    ;


AddExp
    : MulExp {$$ = $1;}
    | AddExp ADD MulExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
    }
    | AddExp SUB MulExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
    }
    ;
RelExp
    : AddExp {$$ = $1;}
    | RelExp LESS AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESS, $1, $3);
    }
    | RelExp NG AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::NG, $1, $3);
    }
    | RelExp GT AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GT, $1, $3);
    }
    | RelExp GE AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GE, $1, $3);
    }
    ;

EqExp
    : RelExp {$$ = $1;}
    | EqExp EQU RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::EQU, $1, $3);
    }
    | EqExp NE RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::NE, $1, $3);
    }

LAndExp
    : EqExp {$$ = $1;}
    | LAndExp AND EqExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::AND, $1, $3);
    }
    ;
LOrExp
    : LAndExp {$$ = $1;}
    | LOrExp OR LAndExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::OR, $1, $3);
    }
    ;
Type
    : INT {
        $$ = TypeSystem::intType;
    }
    | VOID {
        $$ = TypeSystem::voidType;
    }
    | FLOAT_DEF {
        $$ = TypeSystem::floatType;
    }
    ;

FuncRParams 
    : Exp {$$ = $1;}
    | FuncRParams COMMA Exp {
        $$ = $1;
        $$->setnext($3);
    }


/* 定义语句 */
DeclStmt
    : VarDeclStmt {$$=$1;} /* int a,b; */
    | ConstDeclStmt {$$=$1;} /* const int a,b; */
    ;

/* int a,b,c=1; */
VarDeclStmt
    :
    Type VarDefList SEMICOLON {
        $$=$2;
    }
    ;

/* const int a,b; */
ConstDeclStmt
    :
    CONST Type ConstDefList SEMICOLON {
        $$=$3;
    }
    ;

/* a,b,c,d */
VarDefList
    :
    VarDef {$$=$1;}
    |
    VarDefList COMMA VarDef{
        $$=$1;
        $1->setnext($3);
    }
    ;

ConstDefList
    : ConstDefList COMMA ConstDef {
        $$ = $1;
        $1->setnext($3);
    }
    | ConstDef {$$ = $1;}
    ;

/* a|a=1 */
VarDef
    :
    ID {
        SymbolEntry *se;
        se = new IdentifierSymbolEntry(TypeSystem::intType,$1, identifiers->getLevel());
        assert(se!=nullptr);
        identifiers->install($1, se);
        /* 没有expr，不用单独存 */
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ASSIGN Exp {
        SymbolEntry *se;
        se = new IdentifierSymbolEntry(TypeSystem::intType,$1, identifiers->getLevel());
        identifiers->install($1, se);
        /* 
        */
        /* 有expr，需要单独存 */
        $$ = new DeclStmt(new Id(se),$3);
        delete []$1;
    }
    ;

/* 必须有赋值 */
ConstDef
    : ID ASSIGN Exp {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::constIntType, $1, identifiers->getLevel());
        identifiers->install($1, se);
        /* */
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }

/* int a(){} */
FuncDef
    :
    Type ID {
        /* 开启一个新的符号表，identifiers指向新的符号表
        表示参数的符号表，在此之前存一下相对的全局的符号表的指针*/
        globals = identifiers;
        identifiers = new SymbolTable(identifiers);
        printf("11");
    }
    LPAREN FUNCPARAMS RPAREN {
        std::vector<Type*> paramsType;
        /* FUNCPARAMS->PARAMS->PARAM返回了DeclStmt类型的节点（但是还有个空，所以需要强制一下） */
        DeclStmt* temp = (DeclStmt*)$5;
        while(temp){
            /* 循环将所有的参数存入 */
            paramsType.push_back(temp->getId()->getSymbolEntry()->getType());
            temp=(DeclStmt*)(temp->getnext());
        }
        Type* funcType=new FunctionType($1,paramsType);
        SymbolEntry *se = new IdentifierSymbolEntry(funcType, $2, globals->getLevel());
        /* 存入函数名 */
        globals->install($2, se);
        /* 开启一个新的符号表，identifiers指向新的符号表 */
        //identifiers = new SymbolTable(identifiers);
    }
    BlockStmt
    {
        SymbolEntry *se;
        /* 这里查找了上一个符号表中的这个函数对应的那个表（但是学姐不是这么写的） */
        se = globals->lookup($2);
        assert(se != nullptr);
        /* {} 也算一个 */
        $$ = new FunctionDef(se, $8);
        //把参数表的符号表删除
        SymbolTable *top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete []$2;
    }
    ;

/* 函数参数->要么有，可以有多个，要么为空 */
FUNCPARAMS
    : PARAMS {$$=$1;}
    | %empty {$$=nullptr;}
    ;

/* 递归形式 */
PARAMS
    : PARAMS COMMA PARAM {
        $$=$1;
        $$->setnext($3);
    }
    | PARAM {
        $$=$1;
    }
    ;

/* 作为函数参数的int a */
PARAM
    : Type ID {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel());
        identifiers->install($2, se);
        /* 返回的是DeclStmt类型的节点 */
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    ;

/* expr; */
ExprStmt
    :
    Exp SEMICOLON{
        $$=new ExprStmt($1);
    }
    ;

/* while(cond)stmt */
WhileStmt
    :
    WHILE LPAREN Cond RPAREN Stmt{
        $$=new WhileStmt($3,$5);
    }
    ;

/* for */


/* break */
BreakStmt
    :
    BREAK SEMICOLON{
        $$ = new BreakStmt();
    }
    ;

/* continue */
ContinueStmt
    :
    CONTINUE SEMICOLON{
        $$=new ContinueStmt();
    }
    ;

%%
int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
