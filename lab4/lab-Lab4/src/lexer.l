%option noyywrap
%option nounput
%option noinput
%top{
    #include <stdarg.h>
    #include "common.h"
    #include "parser.h"
}
%{
    extern dump_type_t dump_type;

    inline void dump_tokens(const char* format, ...){
        va_list args;
        va_start(args, format);
        if (dump_type == TOKENS)
            vfprintf(yyout, format, args);
        va_end(args);
    }

    /* Your code here, if desired (lab3). */
%}

/* definitions section */
DECIMIAL ([1-9][0-9]*|0)
FLOAT_DEC (([0-9]+)(\.([0-9]*))?)((e|E)(-|\+)?[1-9]*)?
/*八进制前缀是0*/
OCTAL (0[1-7][0-7]*|00)
/*十六进制前缀是0x或者0X*/
HEX (0[xX][1-9a-fA-F][0-9a-fA-F]*|0[xX]0)
FLOAT_HEX (0[xX][0-9a-fA-F]*(\.[0-9a-fA-F]*)?)((p|P)(-|\+)?[1-9a-fA-F]*)?
/*[:alpha:]匹配字母字符，[:digit:]匹配数字字符*/
/*以字母或下划线开头的*/
ID [[:alpha:]_][[:alpha:][:digit:]_]*
CHAR ('.')
/*匹配换行回车*/
EOL (\r\n|\n|\r)
WHITE [\t ]
LINECOMMENT \/\/[^\n]*
BLOCKCOMMENTBEGIN \/\*
BLOCKCOMMENTELEMENT .
BLOCKCOMMENTEND \*\/
%x COMMENT
/*  Your code here (lab3). */

%%
    /* rules section */
    /* rules section */
    /*
    目前支持的：
    int void char float_def
    if else return while for
    break continue
    = > < <= >= != == ! & | && ||
    + - * / %
    ; ( ) { } [ ] , .
    const
    */
    
"int" {
    dump_tokens("INT\t%s\n", yytext);
    return INT;
}

"void" {
    dump_tokens("VOID\t%s\n", yytext);
    return VOID;
}

"if" {
    dump_tokens("IF\t%s\n", yytext);
    return IF;
}

"else" {
    dump_tokens("ELSE\t%s\n", yytext);
    return ELSE;
}

"return" {
    dump_tokens("RETURN\t%s\n", yytext);
    return RETURN;
}

"=" {
    dump_tokens("ASSIGN\t%s\n", yytext);
    return ASSIGN;
}

"<" {
    dump_tokens("LESS\t%s\n", yytext);
    return LESS;
}

"+" {
    dump_tokens("ADD\t%s\n", yytext);
    return ADD;
}

";" {
    dump_tokens("SEMICOLON\t%s\n", yytext);
    return SEMICOLON;
}

"(" {
    dump_tokens("LPAREN\t%s\n", yytext);
    return LPAREN;
}

")" {
    dump_tokens("RPAREN\t%s\n", yytext);
    return RPAREN;
}

"{" {
    dump_tokens("LBRACE\t%s\n", yytext);
    return LBRACE;
}

"}" {
    dump_tokens("RBRACE\t%s\n", yytext);
    return RBRACE;
}

"const" {
    dump_tokens("CONST\t%s\n", yytext);
    return CONST;
}

"*" {
    dump_tokens("MUL\t%s\n", yytext);
    return MUL;
}

"/" {
    dump_tokens("DIV\t%s\n", yytext);
    return DIV;
}

"-" {
    dump_tokens("SUB\t%s\n", yytext);
    return SUB;
}

"%" {
    dump_tokens("MOD\t%s\n", yytext);
    return MOD;
}

"==" {
    dump_tokens("EQU\t%s\n", yytext);
    return EQU;
}

">=" {
    dump_tokens("GE\t%s\n", yytext);
    return GE;
}

"<=" {
    dump_tokens("NG\t%s\n", yytext);
    return NG;
}

"!=" {
    dump_tokens("NE\t%s\n", yytext);
    return NE;
}

"!" {
    dump_tokens("NOT\t%s\n", yytext);
    return NOT;
}

">" {
    dump_tokens("GT\t%s\n", yytext);
    return GT;
}

"char" {
    dump_tokens("CHAR\t%s\n", yytext);
    return CHAR;
}

"float" {
    dump_tokens("FLOAT\t%s\n", yytext);
    return FLOAT_DEF;
}

"while" {
    dump_tokens("WHILE\t%s\n", yytext);
    return WHILE;
}

"for" {
    dump_tokens("FOR\t%s\n", yytext);
    return FOR;
}

"break" {
    dump_tokens("BREAK\t%s\n", yytext);
    return BREAK;
}

"continue" {
    dump_tokens("CONTINUE\t%s\n", yytext);
    return CONTINUE;
}

"," {
    dump_tokens("COMMA\t%s\n", yytext);
    return COMMA;
}

"[" {
    dump_tokens("LSBRAC\t%s\n", yytext);
    return LSBRAC;
}

"]" {
    dump_tokens("RSBRAC\t%s\n", yytext);
    return RSBRAC;
}

"&" {
    dump_tokens("SBSAND\t%s\n", yytext);
    return SBSAND;
}

"|" {
    dump_tokens("SBSOR\t%s\n", yytext);
    return SBSOR;
}

"&&" {
    dump_tokens("AND\t%s\n", yytext);
    return AND;
}

"||" {
    dump_tokens("OR\t%s\n", yytext);
    return OR;
}

"." {
    dump_tokens("DOT\t%s\n", yytext);
    return DOT;
}

"putint" {
    //lexeme传递ID的返回值
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    vec.push_back(TypeSystem::intType);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel());
    st->install(yytext, se);
    return ID;
}

"getint" {
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    Type* funcType = new FunctionType(TypeSystem::intType, vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel());
    st->install(yytext, se);
    return ID;
}
"putch" {
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    vec.push_back(TypeSystem::intType);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel());
    st->install(yytext, se);
    return ID;
}
"getch" {
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    Type* funcType = new FunctionType(TypeSystem::intType, vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel());
    st->install(yytext, se);
    return ID;
}


{DECIMIAL} {
    int decimal;
    decimal = atoi(yytext);
    dump_tokens("DECIMAL\t%s\t%d\n", yytext, decimal);
    yylval.itype = decimal;
    return INTEGER;
}

{OCTAL} {
    int len = strlen(yytext);
    int decimalNum = 0; // 存储8进制整数的值
    for (int i = 1; i < len; i++) {
        // 第一个字符表示八进制
        int digit = yytext[i] - '0';
        // ascii值转整数值
        decimalNum = decimalNum * 8 + digit;
    }
    dump_tokens("OCTAL\t%s\t%d\n", yytext, decimalNum);
    yylval.itype = decimalNum;
    return INTEGER;
}

{HEX} {
    int len = strlen(yytext);
    int decimalNum = 0; // 存储16进制整数的值
    for (int i = 2; i < len; i++) {
        //第一二个字符表示十六进制
        int digit = yytext[i] - '0';
        decimalNum = decimalNum * 16 + digit;
    }
    dump_tokens("HEX\t%s\t%d\n", yytext, decimalNum);
    yylval.itype = decimalNum;
    return INTEGER;
}

{FLOAT_DEC} {
    double value;
    value=strtod(yytext,NULL);
    dump_tokens("FLOAT_DEC\t%s\t%.10f\n", yytext, value);
    yylval.flotype = value;
    return FLOAT;
}

{FLOAT_HEX} {
    double value;
    value=strtod(yytext,NULL);
    dump_tokens("FLOAT_HEX\t%s\t%.10f\n", yytext, value);
    yylval.flotype = value;
    return FLOAT;
}

{ID} {
    char *lexeme;
    dump_tokens("ID\t%s\n", yytext);
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    return ID;
}

{EOL} yylineno++;

{WHITE} {

}

{LINECOMMENT} {
    // 注释//
    dump_tokens("LINECOMMENT\t%s\n", yytext);
    //yylineno++;
}

{BLOCKCOMMENTBEGIN} {
    dump_tokens("BC_BEGIN\t%s\n", yytext);
    // 开始块注释
    BEGIN COMMENT;
}
<COMMENT>{BLOCKCOMMENTELEMENT} {
}
<COMMENT>{BLOCKCOMMENTEND} {
    dump_tokens("BC_END\t%s\n", yytext);
    BEGIN INITIAL;
}// 设置启动条件为初始条件

    /*  Your code here (lab3). */
%%
/* user code section */
