%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#ifndef YYSTYPE
#define YYSTYPE char*
#endif

int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
char* concat_strings(const char* str1, const char* str2, const char* str3);

%}

// 定义词法单词类别
%token LPA RPA
%token MUL DIV
%token NUMBER
%token ADD MINUS

%left ADD MINUS
%left MUL DIV
%right UMINUS

%%

lines   :       lines expr '\n' { printf("%s\n", $2); free($2); }
        |       lines '\n'
        |
        ;

expr    :       expr ADD expr   { $$ = concat_strings($1, $3, "+"); free($1); free($3); }
				//$2 并没有被包含在最终的组合字符串中，因此不需要在这里释放它
        |       expr MINUS expr   { $$ = concat_strings($1, $3, "-"); free($1); free($3); }
        |       expr MUL expr   { $$ = concat_strings($1, $3, "*"); free($1); free($3); }
        |       expr DIV expr   { $$ = concat_strings($1, $3, "/"); free($1); free($3); }
        |       LPA expr RPA     { $$ = concat_strings("(", $2, ")"); free($2); }
        |       MINUS expr %prec UMINUS   { $$ = concat_strings("-", $2, ""); free($2); }
        |       NUMBER { $$ = strdup($1); free($1); }
        ;

%%

// 程序部分

int my_isdigit(int a){ // 判断是否为整数
    if(a >= '0' && a <= '9')
        return 1;
    return 0;
}

char* concat_strings(const char* str1, const char* str2, const char* str3) {
    char* result = (char*)malloc(strlen(str1) + strlen(str2) + strlen(str3) + 3);
    strcpy(result, str1);
    strcat(result," ");
    strcat(result, str2);
    strcat(result," ");
    strcat(result, str3);
    return result;
}

int yylex()
{
    int t;
    while(1){
        t = getchar();
        if(t == ' ' || t == '\t'){
            // 忽略空格和制表符
            continue;
        } else if(my_isdigit(t)){ // 使用重命名的函数
            // 识别多位整数
            char num_buffer[100];
            int i = 0;
            num_buffer[i++] = t;
            while((t = getchar()) && my_isdigit(t) && i < 99){
                num_buffer[i++] = t;
            }
            num_buffer[i] = '\0';
            ungetc(t, stdin); // 将多读的字符放回输入流
            yylval = strdup(num_buffer); // 使用yylval传递值
            //strdup用于创建一个动态分配的字符串副本
            return NUMBER;
        } else if(t == '+'){
            return ADD;
        } else if(t == '-'){
            return MINUS;
        } else if(t == '*'){
            return MUL;
        } else if(t == '/'){
            return DIV;
        } else if(t == '('){
            return LPA;
        } else if(t == ')'){
            return RPA;
        } else if(t == '\n'){
            return '\n'; // 忽略换行符
        } else{
            return t; // 返回其他字符
        }
    }
}

int main(void)
{
    yyin = stdin;
    do{
        yyparse();
    } while(!feof(yyin));
    return 0;
}

void yyerror(const char* s){
    fprintf(stderr,"Parse error: %s\n",s);
    exit(1);
}

