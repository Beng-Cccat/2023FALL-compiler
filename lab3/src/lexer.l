%option noyywrap
%option nounput
%option noinput
%option yylineno
%top{
    #include <stdarg.h>
    //#include "common.h"
}
%{
    //extern dump_type_t dump_type;
    //包含了全部变量和自定义函数的声明
    int yycolum=0;  //用于跟踪当前符号的列数
    int num=0;  // 记录前一个符号的长度
    void dump_tokens(const char* format, ...){
        // 用于生成输出
        // 接受一个格式字符串和可变数量的参数
        va_list args;
        va_start(args, format);
        //if (dump_type == TOKENS)
        vfprintf(yyout, format, args);
        // 将格式化文本输出到yyout
        va_end(args);
    }
    void colum_add(int num){
        // 每次识别到一个新的符号时
        // 加上前一个符号的长度
        yycolum+=num;
    }
    void colum_clear(){
        // 换行时列数清零
        yycolum=0;
    }
    // 符号表结构
    struct SymbolEntry{
        char* name;
    };
    // 符号表数组
    struct SymbolEntry SymbolTable[1000]; // 假设最多存储1000个标识符
    int Snum=0; // 存储标识符数量
    // 对符号表的操作
    struct SymbolEntry* symlook(char *s){
        int i;
        for(i=0;i<Snum;i++){
            if(!strcmp(SymbolTable[i].name, s)){
                //如果标识符相等
                //返回该标识符地址
                return &SymbolTable[i];
            }
        }
        // 如果没有匹配到
        if(Snum<1000){
            //如果符号数没有超出最大个数
            //将新标识符字符串复制到符号表空间
            SymbolTable[Snum].name=strdup(s);
            Snum++;//符号个数++
            return &SymbolTable[i];
        }
        // 否则，符号表满了，装不下
        fprintf(stderr, "Symbol table is full.\n");
        exit(1);
    }
    /* Your code here, if desired (lab3). */
%}

/* definitions section */
/*匹配的具体的规则*/
/* 十进制 */
DECIMIAL ([1-9][0-9]*|0)
FLOAT_DEC (([0-9]*)(\.([0-9]*))?)((e|E)(-|\+)?[1-9]*)?
/*八进制前缀是0*/
OCTAL (0[1-7][0-7]*|00)
/*十六进制前缀是0x或者0X*/
HEX (0[xX][1-9a-fA-F][0-9a-fA-F]*|0[xX]0)
FLOAT_HEX (0[xX][0-9a-fA-F]*(\.[0-9a-fA-F]*)?)((p|P)(-|\+)?[1-9a-fA-F]*)?
/*[:alpha:]匹配字母字符，[:digit:]匹配数字字符*/
/*以字母或下划线开头的*/
ID [[:alpha:]_][[:alpha:][:digit:]_]*
/*匹配单个字符的ASCII码*/
CHAR ('.')
/*匹配换行回车*/
EOL (\r\n|\n|\r)
/*匹配空白字符*/
WHITE [\t ]
/*匹配单行注释*/
LINECOMMENT \/\/[^\n]*
BLOCKCOMMENTBEGIN \/\*
BLOCKCOMMENTELEMENT1 .
BLOCKCOMMENTELEMENT2 \n
BLOCKCOMMENTEND \*\/
%x COMMENT
/*声明了一个新的排他性启动条件*/

/*  Your code here (lab3). */

%%
    /* rules section */
    /*
    目前支持的：
    int void char float
    if else return while for
    break continue
    = > < <= >= != == ! & | && ||
    + - * / %
    ; ( ) { } [ ] , .
    const
    */
"int" {
    colum_add(num);
    dump_tokens("INT\t\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

"void" {
    colum_add(num);
    dump_tokens("VOID\t\t%s\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

"if" {
    colum_add(num);
    dump_tokens("IF\t\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
}

"else" {
    colum_add(num);
    dump_tokens("ELSE\t\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

"return" {
    colum_add(num);
    dump_tokens("RETURN\t\t%s\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

"=" {
    colum_add(num);
    dump_tokens("ASSIGN\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

"<" {
    colum_add(num);
    dump_tokens("LESS\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

"+" {
    colum_add(num);
    dump_tokens("ADD\t\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

";" {
    colum_add(num);
    dump_tokens("SEMICOLON\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

"(" {
    colum_add(num);
    dump_tokens("LPAREN\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

")" {
    colum_add(num);
    dump_tokens("RPAREN\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

"{" {
    colum_add(num);
    dump_tokens("LBRACE\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}

"}" {
    colum_add(num);
    dump_tokens("RBRACE\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"const" {
    colum_add(num);
    dump_tokens("CONST\t\t%s\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"*" {
    colum_add(num);
    dump_tokens("MUL\t\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"/" {
    colum_add(num);
    dump_tokens("DIV\t\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"-" {
    colum_add(num);
    dump_tokens("SUB\t\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"%" {
    colum_add(num);
    dump_tokens("MOD\t\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"==" {
    colum_add(num);
    dump_tokens("EQU\t\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
">=" {
    colum_add(num);
    dump_tokens("GE\t\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"<=" {
    colum_add(num);
    dump_tokens("NG\t\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"!=" {
    colum_add(num);
    dump_tokens("NE\t\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"!" {
    colum_add(num);
    dump_tokens("NOT\t\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);
}
">" {
    colum_add(num);
    dump_tokens("GREATER\t\t%s\t\t\t%d\t%d\n",yytext,yylineno,yycolum);
    num=strlen(yytext);  
}
"char" {
    colum_add(num);
    dump_tokens("CHAR\t\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"while" {
    colum_add(num);
    dump_tokens("WHILE\t\t%s\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"for" {
    colum_add(num);
    dump_tokens("FOR\t\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"break" {
    colum_add(num);
    dump_tokens("BREAK\t\t%s\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"continue" {
    colum_add(num);
    dump_tokens("CONTINUE\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);
}
"," {
    colum_add(num);
    dump_tokens("COMMA\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext);  
}
"[" {
    colum_add(num);
    dump_tokens("LBRAC\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext); 
}
"]" {
    colum_add(num);
    dump_tokens("RBRAC\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext); 
}
"&" {
    colum_add(num);
    dump_tokens("SBSAND\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext); 
}
"|" {
    colum_add(num);
    dump_tokens("SBSOR\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext); 
}
"&&" {
    colum_add(num);
    dump_tokens("AND\t\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext); 
}
"||" {
    colum_add(num);
    dump_tokens("OR\t\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext); 
}
"." {
    colum_add(num);
    dump_tokens("DOT\t\t\t%s\t\t\t%d\t%d\n", yytext,yylineno,yycolum);
    num=strlen(yytext); 
}
{DECIMIAL} {
    int decimal;
    //返回十进制整数的值
    decimal = atoi(yytext);
    colum_add(num);
    dump_tokens("DECIMAL\t\t%s\t\t\t%d\t%d\t%d\n", yytext, yylineno,yycolum,decimal);
    num=strlen(yytext);
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
    colum_add(num);
    dump_tokens("OCTAL\t\t%s\t\t\t%d\t%d\t%d\n", yytext, yylineno,yycolum,decimalNum);
    num=strlen(yytext);
}

{HEX} {
    int len = strlen(yytext);
    int decimalNum = 0; // 存储16进制整数的值
    for (int i = 2; i < len; i++) {
        //第一二个字符表示十六进制
        int digit = yytext[i] - '0';
        decimalNum = decimalNum * 16 + digit;
    }
    colum_add(num);
    dump_tokens("HEX\t\t\t%s\t\t%d\t%d\t%d\n", yytext, yylineno,yycolum,decimalNum);
    num=strlen(yytext);
}

{FLOAT_DEC} {
    double value;
    value=strtod(yytext,NULL);
    colum_add(num);
    dump_tokens("FLOAT_DEC\t%s\t\t\t%d\t%d\t%.10f\n", yytext, yylineno,yycolum,value);
    num=strlen(yytext);
}

{FLOAT_HEX} {
    double value;
    value=strtod(yytext,NULL);
    colum_add(num);
    dump_tokens("FLOAT_HEX\t%s\t\t\t%d\t%d\t%.10f\n", yytext, yylineno,yycolum,value);
    num=strlen(yytext);
}

{ID} {
    // 标识符
    colum_add(num);
    // 判断标识符长度
    num=strlen(yytext);
    // 获取匹配的标识符文本
    char *idname;
    idname= (char *) malloc((num+1)*sizeof(char));
    strncpy(idname, yytext, num);
    idname[num]='\0';
    // 使用函数对符号表进行操作
    struct SymbolEntry* addr=symlook(idname);

    // 输出
    if(num>=8){
        dump_tokens("ID\t\t\t%s\t%d\t%d\t%p\n", yytext,yylineno,yycolum,addr);
    }
    else if(num>=4){
        dump_tokens("ID\t\t\t%s\t\t%d\t%d\t%p\n", yytext,yylineno,yycolum,addr);
    }
    else{
        dump_tokens("ID\t\t\t%s\t\t\t%d\t%d\t%p\n", yytext,yylineno,yycolum,addr);
    }
}

{EOL} {
    // yylineno++行数增加
    // yylineno遇到换行符自动递增
    // 换行列数清零
    colum_clear();
    num=0;
}

{WHITE} {
    colum_add(num);
    num=1;
}

{LINECOMMENT} {
    // 注释//
    colum_add(num);
    num=2;
    dump_tokens("LINECOMMENT\t\t\t\t%d\t%d\n", yylineno,yycolum);
    //yylineno++;
}

{BLOCKCOMMENTBEGIN} {
    colum_add(num);
    num=2;
    dump_tokens("BC_BEGIN\t\t\t\t%d\t%d\n", yylineno,yycolum);
    // 开始块注释
    BEGIN COMMENT;
}
<COMMENT>{BLOCKCOMMENTELEMENT1} {
    colum_add(num);
    num=1;
}
<COMMENT>{BLOCKCOMMENTELEMENT2} {
    //yylineno++;
    colum_clear();
    num=0;
}
<COMMENT>{BLOCKCOMMENTEND} {
    colum_add(num);
    num=2;
    dump_tokens("BC_END\t\t\t\t\t%d\t%d\n", yylineno,yycolum);
    BEGIN INITIAL;
}// 设置启动条件为初始条件

    /*  Your code here (lab3). */
%%
/* user code section */
/*int main(int argc,char **argv){
    if(argc>1){
        yyin=fopen(argv[1],"r");
        if(argc>2){
            yyout=fopen(argv[2],"w");
        }
    }
    yylex();
    return 0;

    FILE *file=fopen("../test/level1-2/1080_lcm.sy","r");
    if(file==NULL){
        printf("FILE NOT EXITS!\n");
        return 0;
    }
    yyin=file;
    yylex();
    return 0;
}
*/
