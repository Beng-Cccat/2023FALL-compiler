/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* "%code top" blocks.  */
#line 1 "src/parser.y"

    #include <iostream>
    #include <assert.h>
    #include <stack>
    #include "parser.h"
    #include <cstring>
    extern Ast ast;
    int yylex();
    int yyerror( char const * );
    std::stack<StmtNode*> whileStack;
    ReturnStmt *ret=nullptr;
    int paramNo = 0;//ffclab6
    //ffcarr
    ArrayType* arrayType;
    int idx;
    int* arrayValue;
    std::stack<InitValueListExpr*> stk;
    InitValueListExpr* top;
    int leftCnt = 0;

#line 89 "src/parser.cpp"




# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "parser.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ID = 3,                         /* ID  */
  YYSYMBOL_INTEGER = 4,                    /* INTEGER  */
  YYSYMBOL_FLOAT = 5,                      /* FLOAT  */
  YYSYMBOL_IF = 6,                         /* IF  */
  YYSYMBOL_ELSE = 7,                       /* ELSE  */
  YYSYMBOL_INT = 8,                        /* INT  */
  YYSYMBOL_VOID = 9,                       /* VOID  */
  YYSYMBOL_LPAREN = 10,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 11,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 12,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 13,                    /* RBRACE  */
  YYSYMBOL_SEMICOLON = 14,                 /* SEMICOLON  */
  YYSYMBOL_ADD = 15,                       /* ADD  */
  YYSYMBOL_SUB = 16,                       /* SUB  */
  YYSYMBOL_OR = 17,                        /* OR  */
  YYSYMBOL_AND = 18,                       /* AND  */
  YYSYMBOL_LESS = 19,                      /* LESS  */
  YYSYMBOL_ASSIGN = 20,                    /* ASSIGN  */
  YYSYMBOL_RETURN = 21,                    /* RETURN  */
  YYSYMBOL_CONST = 22,                     /* CONST  */
  YYSYMBOL_MUL = 23,                       /* MUL  */
  YYSYMBOL_DIV = 24,                       /* DIV  */
  YYSYMBOL_MOD = 25,                       /* MOD  */
  YYSYMBOL_EQU = 26,                       /* EQU  */
  YYSYMBOL_GE = 27,                        /* GE  */
  YYSYMBOL_LE = 28,                        /* LE  */
  YYSYMBOL_NE = 29,                        /* NE  */
  YYSYMBOL_NOT = 30,                       /* NOT  */
  YYSYMBOL_GT = 31,                        /* GT  */
  YYSYMBOL_CHAR = 32,                      /* CHAR  */
  YYSYMBOL_WHILE = 33,                     /* WHILE  */
  YYSYMBOL_FOR = 34,                       /* FOR  */
  YYSYMBOL_BREAK = 35,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 36,                  /* CONTINUE  */
  YYSYMBOL_COMMA = 37,                     /* COMMA  */
  YYSYMBOL_DOT = 38,                       /* DOT  */
  YYSYMBOL_FLOAT_DEF = 39,                 /* FLOAT_DEF  */
  YYSYMBOL_LSBRAC = 40,                    /* LSBRAC  */
  YYSYMBOL_RSBRAC = 41,                    /* RSBRAC  */
  YYSYMBOL_SBSAND = 42,                    /* SBSAND  */
  YYSYMBOL_SBSOR = 43,                     /* SBSOR  */
  YYSYMBOL_THEN = 44,                      /* THEN  */
  YYSYMBOL_YYACCEPT = 45,                  /* $accept  */
  YYSYMBOL_Program = 46,                   /* Program  */
  YYSYMBOL_Stmts = 47,                     /* Stmts  */
  YYSYMBOL_48_1 = 48,                      /* $@1  */
  YYSYMBOL_Stmt = 49,                      /* Stmt  */
  YYSYMBOL_LVal = 50,                      /* LVal  */
  YYSYMBOL_AssignStmt = 51,                /* AssignStmt  */
  YYSYMBOL_BlockStmt = 52,                 /* BlockStmt  */
  YYSYMBOL_53_2 = 53,                      /* $@2  */
  YYSYMBOL_IfStmt = 54,                    /* IfStmt  */
  YYSYMBOL_ReturnStmt = 55,                /* ReturnStmt  */
  YYSYMBOL_BlankStmt = 56,                 /* BlankStmt  */
  YYSYMBOL_Exp = 57,                       /* Exp  */
  YYSYMBOL_Cond = 58,                      /* Cond  */
  YYSYMBOL_ConstExp = 59,                  /* ConstExp  */
  YYSYMBOL_PrimaryExp = 60,                /* PrimaryExp  */
  YYSYMBOL_UnaryExp = 61,                  /* UnaryExp  */
  YYSYMBOL_MulExp = 62,                    /* MulExp  */
  YYSYMBOL_AddExp = 63,                    /* AddExp  */
  YYSYMBOL_RelExp = 64,                    /* RelExp  */
  YYSYMBOL_EqExp = 65,                     /* EqExp  */
  YYSYMBOL_LAndExp = 66,                   /* LAndExp  */
  YYSYMBOL_LOrExp = 67,                    /* LOrExp  */
  YYSYMBOL_Type = 68,                      /* Type  */
  YYSYMBOL_FuncRParams = 69,               /* FuncRParams  */
  YYSYMBOL_DeclStmt = 70,                  /* DeclStmt  */
  YYSYMBOL_VarDeclStmt = 71,               /* VarDeclStmt  */
  YYSYMBOL_ConstDeclStmt = 72,             /* ConstDeclStmt  */
  YYSYMBOL_VarDefList = 73,                /* VarDefList  */
  YYSYMBOL_ConstDefList = 74,              /* ConstDefList  */
  YYSYMBOL_ArrayIndices = 75,              /* ArrayIndices  */
  YYSYMBOL_VarDef = 76,                    /* VarDef  */
  YYSYMBOL_77_3 = 77,                      /* @3  */
  YYSYMBOL_InitVal = 78,                   /* InitVal  */
  YYSYMBOL_79_4 = 79,                      /* @4  */
  YYSYMBOL_ConstDef = 80,                  /* ConstDef  */
  YYSYMBOL_81_5 = 81,                      /* @5  */
  YYSYMBOL_ConstInitVal = 82,              /* ConstInitVal  */
  YYSYMBOL_83_6 = 83,                      /* @6  */
  YYSYMBOL_InitValList = 84,               /* InitValList  */
  YYSYMBOL_ConstInitValList = 85,          /* ConstInitValList  */
  YYSYMBOL_FuncDef = 86,                   /* FuncDef  */
  YYSYMBOL_87_7 = 87,                      /* $@7  */
  YYSYMBOL_88_8 = 88,                      /* @8  */
  YYSYMBOL_FUNCPARAMS = 89,                /* FUNCPARAMS  */
  YYSYMBOL_PARAMS = 90,                    /* PARAMS  */
  YYSYMBOL_PARAM = 91,                     /* PARAM  */
  YYSYMBOL_FuncArrayIndices = 92,          /* FuncArrayIndices  */
  YYSYMBOL_ExprStmt = 93,                  /* ExprStmt  */
  YYSYMBOL_WhileStmt = 94,                 /* WhileStmt  */
  YYSYMBOL_95_9 = 95,                      /* @9  */
  YYSYMBOL_BreakStmt = 96,                 /* BreakStmt  */
  YYSYMBOL_ContinueStmt = 97               /* ContinueStmt  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   227

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  45
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  53
/* YYNRULES -- Number of rules.  */
#define YYNRULES  110
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  183

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   299


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    63,    63,    68,    68,    73,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    91,   105,   116,
     122,   121,   138,   145,   148,   155,   160,   167,   174,   178,
     181,   185,   189,   192,   198,   205,   206,   217,   228,   229,
     233,   240,   241,   245,   249,   256,   257,   261,   268,   270,
     275,   279,   283,   290,   291,   295,   302,   304,   312,   314,
     321,   324,   327,   333,   334,   340,   344,   349,   357,   365,
     367,   374,   378,   383,   387,   396,   406,   417,   450,   450,
     484,   521,   544,   544,   581,   593,   593,   629,   664,   690,
     690,   725,   728,   733,   736,   743,   749,   743,   789,   790,
     795,   799,   806,   818,   847,   850,   859,   867,   867,   886,
     899
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ID", "INTEGER",
  "FLOAT", "IF", "ELSE", "INT", "VOID", "LPAREN", "RPAREN", "LBRACE",
  "RBRACE", "SEMICOLON", "ADD", "SUB", "OR", "AND", "LESS", "ASSIGN",
  "RETURN", "CONST", "MUL", "DIV", "MOD", "EQU", "GE", "LE", "NE", "NOT",
  "GT", "CHAR", "WHILE", "FOR", "BREAK", "CONTINUE", "COMMA", "DOT",
  "FLOAT_DEF", "LSBRAC", "RSBRAC", "SBSAND", "SBSOR", "THEN", "$accept",
  "Program", "Stmts", "$@1", "Stmt", "LVal", "AssignStmt", "BlockStmt",
  "$@2", "IfStmt", "ReturnStmt", "BlankStmt", "Exp", "Cond", "ConstExp",
  "PrimaryExp", "UnaryExp", "MulExp", "AddExp", "RelExp", "EqExp",
  "LAndExp", "LOrExp", "Type", "FuncRParams", "DeclStmt", "VarDeclStmt",
  "ConstDeclStmt", "VarDefList", "ConstDefList", "ArrayIndices", "VarDef",
  "@3", "InitVal", "@4", "ConstDef", "@5", "ConstInitVal", "@6",
  "InitValList", "ConstInitValList", "FuncDef", "$@7", "@8", "FUNCPARAMS",
  "PARAMS", "PARAM", "FuncArrayIndices", "ExprStmt", "WhileStmt", "@9",
  "BreakStmt", "ContinueStmt", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-94)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-96)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -94,    24,   156,   156,   -94,     6,   -94,   -94,     7,   -94,
     -94,   197,    23,   -94,   197,   197,    93,     3,   197,    34,
      67,    69,   -94,   -94,    75,   -94,   -94,   -94,   -94,   -94,
      73,   -94,   -94,   124,    78,    46,   -94,   -94,   -94,   -94,
     -94,   -94,   -94,   -94,   -94,   116,   197,    64,   197,   -94,
      91,   -94,   -94,   -94,   -94,   -94,    97,   109,   -94,   197,
     -94,   -94,   197,   -94,   197,   197,   197,   197,   197,     8,
      21,   -94,   -94,   -94,     4,    76,    78,   197,   103,    78,
     111,    62,   100,   105,   -94,    17,   -94,    35,    29,   -94,
     117,   115,   -94,   -94,   -94,   124,   124,   178,    37,   123,
     -94,   131,   -94,   197,   -94,    99,   156,   197,   197,   197,
     197,   197,   197,   197,   197,   -94,   194,    45,   -94,   109,
     -94,   -94,   128,   -94,   -94,   -94,     3,    70,   -94,   -94,
     -94,   136,    78,    78,    78,    78,   111,   111,    62,   100,
     138,   -94,   -94,   -94,   -94,   156,   -94,   178,   178,   151,
     144,   119,   -94,   156,   -94,   194,   194,   -94,   -94,    27,
     -94,   129,   -94,     3,   -94,   -94,    41,   -94,   -94,   178,
     122,   133,   145,   -94,   -94,   194,   -94,   -94,   197,   -94,
     -94,   134,   -94
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       3,     0,     2,     0,     1,    17,    33,    34,     0,    60,
      61,     0,    20,    27,     0,     0,     0,     0,     0,     0,
       0,     0,    62,     5,    32,     6,     7,     8,     9,    16,
       0,    35,    41,    45,    28,     0,    10,    65,    66,    11,
      12,    13,    14,    15,     4,     0,     0,    18,     0,    32,
       0,    22,     3,    38,    39,    26,     0,     0,    40,     0,
     109,   110,     0,   106,     0,     0,     0,     0,     0,    75,
       0,    69,    37,    63,     0,     0,    30,     0,     0,    48,
      53,    56,    58,    29,    31,     0,    25,     0,     0,    72,
       0,     0,    42,    43,    44,    46,    47,     0,    77,     0,
      67,     0,    36,     0,    73,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    21,     0,     0,    68,     0,
     107,    19,    82,    80,    76,    78,    99,    75,    70,    64,
      74,    23,    49,    52,    50,    51,    54,    55,    57,    59,
      89,    87,    84,    85,    71,     0,    81,     0,     0,     0,
       0,    98,   101,     0,    88,     0,     0,   108,    91,     0,
      79,   102,    96,     0,    24,    93,     0,    86,    83,     0,
       0,   103,     0,   100,    90,     0,    92,   104,     0,    97,
      94,     0,   105
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -94,   -94,   127,   -94,     0,    -1,   -94,    12,   -94,   -94,
     -94,   -94,   -11,   121,   -32,   -94,    -5,    32,   -40,    13,
      61,    71,   -94,   -13,   -94,   -94,   -94,   -94,   -94,   -94,
       2,    86,   -94,   -68,   -94,    57,   -94,   -93,   -94,   -94,
     -94,   -94,   -94,   -94,   -94,   -94,    33,   -94,   -94,   -94,
     -94,   -94,   -94
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     1,     2,     3,    23,    49,    25,    26,    52,    27,
      28,    29,    30,    78,   141,    31,    32,    33,    34,    80,
      81,    82,    83,    35,    74,    36,    37,    38,    70,    88,
      98,    71,   148,   124,   147,    89,   156,   142,   155,   159,
     166,    39,    99,   172,   150,   151,   152,   171,    40,    41,
     145,    42,    43
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      50,    24,    24,    44,    57,    56,    76,    47,    79,    53,
      54,     9,    10,    58,    75,   102,    45,    48,   -95,    79,
       5,     6,     7,     8,     4,     9,    10,    11,    97,    12,
     115,    13,    14,    15,    73,   100,    51,    76,    16,    17,
     168,   103,    22,   118,    59,   105,    46,    18,    46,    69,
      19,    91,    20,    21,   174,   116,    22,   125,   101,    92,
      93,    94,   165,   167,   169,   143,   119,   132,   133,   134,
     135,    79,    79,    79,    79,    46,    76,    77,   175,   158,
     160,    60,   180,    61,    24,    77,   123,    63,   111,   117,
      97,   112,   129,    67,    68,    62,     5,     6,     7,    95,
      96,   176,    84,    11,    77,    24,   131,    55,    14,    15,
      46,    86,    87,   149,   106,    76,    76,   104,   113,     5,
       6,     7,   114,    18,   136,   137,    11,    72,   120,   121,
     107,    14,    15,   126,   127,    76,   123,   123,   108,   109,
     130,   146,   110,   153,    24,   157,    18,    64,    65,    66,
     149,   154,    24,   164,   161,   162,   163,    12,   123,     5,
       6,     7,     8,   177,     9,    10,    11,   181,    12,   170,
      13,    14,    15,   178,   138,   182,   144,    16,    17,    85,
      90,     5,     6,     7,   179,   139,    18,   128,    11,    19,
     122,    20,    21,    14,    15,    22,   173,     5,     6,     7,
       5,     6,     7,     0,    11,     0,   140,    11,    18,    14,
      15,     0,    14,    15,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    18,     0,     0,    18
};

static const yytype_int16 yycheck[] =
{
      11,     2,     3,     3,    17,    16,    46,     5,    48,    14,
      15,     8,     9,    18,    46,    11,    10,    10,    10,    59,
       3,     4,     5,     6,     0,     8,     9,    10,    20,    12,
      13,    14,    15,    16,    45,    14,    13,    77,    21,    22,
      13,    37,    39,    14,    10,    77,    40,    30,    40,     3,
      33,    62,    35,    36,    13,    20,    39,    20,    37,    64,
      65,    66,   155,   156,    37,    20,    37,   107,   108,   109,
     110,   111,   112,   113,   114,    40,   116,    40,    37,   147,
     148,    14,   175,    14,    85,    40,    97,    14,    26,    87,
      20,    29,   103,    15,    16,    20,     3,     4,     5,    67,
      68,   169,    11,    10,    40,   106,   106,    14,    15,    16,
      40,    14,     3,   126,    11,   155,   156,    41,    18,     3,
       4,     5,    17,    30,   111,   112,    10,    11,    11,    14,
      19,    15,    16,    10,     3,   175,   147,   148,    27,    28,
      41,    13,    31,     7,   145,   145,    30,    23,    24,    25,
     163,    13,   153,   153,     3,    11,    37,    12,   169,     3,
       4,     5,     6,    41,     8,     9,    10,   178,    12,    40,
      14,    15,    16,    40,   113,    41,   119,    21,    22,    52,
      59,     3,     4,     5,   172,   114,    30,   101,    10,    33,
      12,    35,    36,    15,    16,    39,   163,     3,     4,     5,
       3,     4,     5,    -1,    10,    -1,    12,    10,    30,    15,
      16,    -1,    15,    16,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    30,    -1,    -1,    30
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    46,    47,    48,     0,     3,     4,     5,     6,     8,
       9,    10,    12,    14,    15,    16,    21,    22,    30,    33,
      35,    36,    39,    49,    50,    51,    52,    54,    55,    56,
      57,    60,    61,    62,    63,    68,    70,    71,    72,    86,
      93,    94,    96,    97,    49,    10,    40,    75,    10,    50,
      57,    13,    53,    61,    61,    14,    57,    68,    61,    10,
      14,    14,    20,    14,    23,    24,    25,    15,    16,     3,
      73,    76,    11,    57,    69,    59,    63,    40,    58,    63,
      64,    65,    66,    67,    11,    47,    14,     3,    74,    80,
      58,    57,    61,    61,    61,    62,    62,    20,    75,    87,
      14,    37,    11,    37,    41,    59,    11,    19,    27,    28,
      31,    26,    29,    18,    17,    13,    20,    75,    14,    37,
      11,    14,    12,    57,    78,    20,    10,     3,    76,    57,
      41,    49,    63,    63,    63,    63,    64,    64,    65,    66,
      12,    59,    82,    20,    80,    95,    13,    79,    77,    68,
      89,    90,    91,     7,    13,    83,    81,    49,    78,    84,
      78,     3,    11,    37,    49,    82,    85,    82,    13,    37,
      40,    92,    88,    91,    13,    37,    78,    41,    40,    52,
      82,    57,    41
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    45,    46,    48,    47,    47,    49,    49,    49,    49,
      49,    49,    49,    49,    49,    49,    49,    50,    50,    51,
      53,    52,    52,    54,    54,    55,    55,    56,    57,    58,
      59,    60,    60,    60,    60,    61,    61,    61,    61,    61,
      61,    62,    62,    62,    62,    63,    63,    63,    64,    64,
      64,    64,    64,    65,    65,    65,    66,    66,    67,    67,
      68,    68,    68,    69,    69,    70,    70,    71,    72,    73,
      73,    74,    74,    75,    75,    76,    76,    76,    77,    76,
      78,    78,    79,    78,    80,    81,    80,    82,    82,    83,
      82,    84,    84,    85,    85,    87,    88,    86,    89,    89,
      90,    90,    91,    91,    92,    92,    93,    95,    94,    96,
      97
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     0,     2,     2,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     2,     4,
       0,     4,     2,     5,     7,     3,     2,     1,     1,     1,
       1,     3,     1,     1,     1,     1,     4,     3,     2,     2,
       2,     1,     3,     3,     3,     1,     3,     3,     1,     3,
       3,     3,     3,     1,     3,     3,     1,     3,     1,     3,
       1,     1,     1,     1,     3,     1,     1,     3,     4,     1,
       3,     3,     1,     3,     4,     1,     3,     2,     0,     5,
       1,     2,     0,     4,     3,     0,     5,     1,     2,     0,
       4,     1,     3,     1,     3,     0,     0,     8,     1,     0,
       3,     1,     2,     3,     2,     4,     2,     0,     6,     2,
       2
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: Stmts  */
#line 63 "src/parser.y"
            {
        ast.setRoot((yyvsp[0].stmttype));
    }
#line 1322 "src/parser.cpp"
    break;

  case 3: /* $@1: %empty  */
#line 68 "src/parser.y"
     {fprintf(stderr, "进没进去啊服了\n");
    }
#line 1329 "src/parser.cpp"
    break;

  case 4: /* Stmts: $@1 Stmt  */
#line 69 "src/parser.y"
           {
        (yyval.stmttype)=(yyvsp[0].stmttype);
        fprintf(stderr, "进来了\n");
    }
#line 1338 "src/parser.cpp"
    break;

  case 5: /* Stmts: Stmts Stmt  */
#line 73 "src/parser.y"
                {
        (yyval.stmttype) = new SeqNode((yyvsp[-1].stmttype), (yyvsp[0].stmttype));
    }
#line 1346 "src/parser.cpp"
    break;

  case 6: /* Stmt: AssignStmt  */
#line 78 "src/parser.y"
                 {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1352 "src/parser.cpp"
    break;

  case 7: /* Stmt: BlockStmt  */
#line 79 "src/parser.y"
                {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1358 "src/parser.cpp"
    break;

  case 8: /* Stmt: IfStmt  */
#line 80 "src/parser.y"
             {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1364 "src/parser.cpp"
    break;

  case 9: /* Stmt: ReturnStmt  */
#line 81 "src/parser.y"
                 {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1370 "src/parser.cpp"
    break;

  case 10: /* Stmt: DeclStmt  */
#line 82 "src/parser.y"
               {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1376 "src/parser.cpp"
    break;

  case 11: /* Stmt: FuncDef  */
#line 83 "src/parser.y"
              {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1382 "src/parser.cpp"
    break;

  case 12: /* Stmt: ExprStmt  */
#line 84 "src/parser.y"
              {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1388 "src/parser.cpp"
    break;

  case 13: /* Stmt: WhileStmt  */
#line 85 "src/parser.y"
               {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1394 "src/parser.cpp"
    break;

  case 14: /* Stmt: BreakStmt  */
#line 86 "src/parser.y"
               {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1400 "src/parser.cpp"
    break;

  case 15: /* Stmt: ContinueStmt  */
#line 87 "src/parser.y"
                  {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1406 "src/parser.cpp"
    break;

  case 16: /* Stmt: BlankStmt  */
#line 88 "src/parser.y"
                {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1412 "src/parser.cpp"
    break;

  case 17: /* LVal: ID  */
#line 91 "src/parser.y"
         {
        SymbolEntry *se;
        se = identifiers->lookup((yyvsp[0].strtype));
        if(se == nullptr)
        {
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)(yyvsp[0].strtype));
            delete [](char*)(yyvsp[0].strtype);
            assert(se != nullptr);
        }
        (yyval.exprtype) = new Id(se);
        delete [](yyvsp[0].strtype);
        fprintf(stderr, "LVal成功\n");
    }
#line 1430 "src/parser.cpp"
    break;

  case 18: /* LVal: ID ArrayIndices  */
#line 105 "src/parser.y"
                     {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-1].strtype));
        if(se == nullptr)
            fprintf(stderr, "id \"%s\" 未定义，不能做左值", (char*)(yyvsp[-1].strtype));
        (yyval.exprtype) = new Id(se, (yyvsp[0].exprtype));
        delete [](yyvsp[-1].strtype);
    }
#line 1443 "src/parser.cpp"
    break;

  case 19: /* AssignStmt: LVal ASSIGN Exp SEMICOLON  */
#line 116 "src/parser.y"
                              {
        (yyval.stmttype) = new AssignStmt((yyvsp[-3].exprtype), (yyvsp[-1].exprtype));
    }
#line 1451 "src/parser.cpp"
    break;

  case 20: /* $@2: %empty  */
#line 122 "src/parser.y"
        {identifiers = new SymbolTable(identifiers);}
#line 1457 "src/parser.cpp"
    break;

  case 21: /* BlockStmt: LBRACE $@2 Stmts RBRACE  */
#line 124 "src/parser.y"
        {
            fprintf(stderr, "是你吗哥\n");
            (yyval.stmttype) = new CompoundStmt((yyvsp[-1].stmttype));
            fprintf(stderr, "你是哪里有毛病1\n");
            SymbolTable *top = identifiers;
            fprintf(stderr, "你是哪里有毛病2\n");
            identifiers = identifiers->getPrev();
            fprintf(stderr, "你是哪里有毛病3\n");
            if(top!=nullptr){
                delete top;
            }
            fprintf(stderr, "你是哪里有毛病4\n");
        }
#line 1475 "src/parser.cpp"
    break;

  case 22: /* BlockStmt: LBRACE RBRACE  */
#line 139 "src/parser.y"
    {
        fprintf(stderr, "空");
        (yyval.stmttype)=new CompoundStmt(nullptr);
    }
#line 1484 "src/parser.cpp"
    break;

  case 23: /* IfStmt: IF LPAREN Cond RPAREN Stmt  */
#line 145 "src/parser.y"
                                            {
        (yyval.stmttype) = new IfStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype));
    }
#line 1492 "src/parser.cpp"
    break;

  case 24: /* IfStmt: IF LPAREN Cond RPAREN Stmt ELSE Stmt  */
#line 148 "src/parser.y"
                                           {
        (yyval.stmttype) = new IfElseStmt((yyvsp[-4].exprtype), (yyvsp[-2].stmttype), (yyvsp[0].stmttype));
        fprintf(stderr, "这么牛？！");
    }
#line 1501 "src/parser.cpp"
    break;

  case 25: /* ReturnStmt: RETURN Exp SEMICOLON  */
#line 155 "src/parser.y"
                        {
        ret=new ReturnStmt((yyvsp[-1].exprtype));
        (yyval.stmttype) = new ReturnStmt((yyvsp[-1].exprtype));
        fprintf(stderr, "结束了？\n");
    }
#line 1511 "src/parser.cpp"
    break;

  case 26: /* ReturnStmt: RETURN SEMICOLON  */
#line 160 "src/parser.y"
                       {
        ret=new ReturnStmt();
        (yyval.stmttype) = new ReturnStmt();
    }
#line 1520 "src/parser.cpp"
    break;

  case 27: /* BlankStmt: SEMICOLON  */
#line 167 "src/parser.y"
                {
        (yyval.stmttype) = new BlankStmt();
    }
#line 1528 "src/parser.cpp"
    break;

  case 28: /* Exp: AddExp  */
#line 174 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1534 "src/parser.cpp"
    break;

  case 29: /* Cond: LOrExp  */
#line 178 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1540 "src/parser.cpp"
    break;

  case 30: /* ConstExp: AddExp  */
#line 181 "src/parser.y"
             {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1546 "src/parser.cpp"
    break;

  case 31: /* PrimaryExp: LPAREN Exp RPAREN  */
#line 185 "src/parser.y"
                      {
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 1554 "src/parser.cpp"
    break;

  case 32: /* PrimaryExp: LVal  */
#line 189 "src/parser.y"
         {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 1562 "src/parser.cpp"
    break;

  case 33: /* PrimaryExp: INTEGER  */
#line 192 "src/parser.y"
              {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, (yyvsp[0].itype));
        fprintf(stderr,"creating TYPE Size: %d\n",se->getType()->getSize());
        (yyval.exprtype) = new Constant(se);
        fprintf(stderr, "创好了mo \"%d\"\n", (yyvsp[0].itype));
    }
#line 1573 "src/parser.cpp"
    break;

  case 34: /* PrimaryExp: FLOAT  */
#line 198 "src/parser.y"
            {
        SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::floatType, (yyvsp[0].flotype));
        (yyval.exprtype) = new Constant(se);
    }
#line 1582 "src/parser.cpp"
    break;

  case 35: /* UnaryExp: PrimaryExp  */
#line 205 "src/parser.y"
                 {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1588 "src/parser.cpp"
    break;

  case 36: /* UnaryExp: ID LPAREN FuncRParams RPAREN  */
#line 206 "src/parser.y"
                                   {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-3].strtype));
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)(yyvsp[-3].strtype));
            delete [](char*)(yyvsp[-3].strtype);
            assert(se != nullptr);
        }
        (yyval.exprtype) = new CallExpr(se, (yyvsp[-1].exprtype));
    }
#line 1604 "src/parser.cpp"
    break;

  case 37: /* UnaryExp: ID LPAREN RPAREN  */
#line 217 "src/parser.y"
                       {
        SymbolEntry* se;
        se = identifiers->lookup((yyvsp[-2].strtype));
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)(yyvsp[-2].strtype));
            delete [](char*)(yyvsp[-2].strtype);
            assert(se != nullptr);
        }
        (yyval.exprtype) = new CallExpr(se);
    }
#line 1620 "src/parser.cpp"
    break;

  case 38: /* UnaryExp: ADD UnaryExp  */
#line 228 "src/parser.y"
                   {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1626 "src/parser.cpp"
    break;

  case 39: /* UnaryExp: SUB UnaryExp  */
#line 229 "src/parser.y"
                   {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::SUB, (yyvsp[0].exprtype));
    }
#line 1635 "src/parser.cpp"
    break;

  case 40: /* UnaryExp: NOT UnaryExp  */
#line 233 "src/parser.y"
                   {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::NOT, (yyvsp[0].exprtype));
    }
#line 1644 "src/parser.cpp"
    break;

  case 41: /* MulExp: UnaryExp  */
#line 240 "src/parser.y"
               {(yyval.exprtype)=(yyvsp[0].exprtype);}
#line 1650 "src/parser.cpp"
    break;

  case 42: /* MulExp: MulExp MUL UnaryExp  */
#line 241 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MUL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1659 "src/parser.cpp"
    break;

  case 43: /* MulExp: MulExp DIV UnaryExp  */
#line 245 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::DIV, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1668 "src/parser.cpp"
    break;

  case 44: /* MulExp: MulExp MOD UnaryExp  */
#line 249 "src/parser.y"
                          {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MOD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1677 "src/parser.cpp"
    break;

  case 45: /* AddExp: MulExp  */
#line 256 "src/parser.y"
             {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1683 "src/parser.cpp"
    break;

  case 46: /* AddExp: AddExp ADD MulExp  */
#line 257 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::ADD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1692 "src/parser.cpp"
    break;

  case 47: /* AddExp: AddExp SUB MulExp  */
#line 261 "src/parser.y"
                        {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::SUB, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1701 "src/parser.cpp"
    break;

  case 48: /* RelExp: AddExp  */
#line 268 "src/parser.y"
           {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1707 "src/parser.cpp"
    break;

  case 49: /* RelExp: RelExp LESS AddExp  */
#line 271 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESS, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1716 "src/parser.cpp"
    break;

  case 50: /* RelExp: RelExp LE AddExp  */
#line 275 "src/parser.y"
                       {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LE, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1725 "src/parser.cpp"
    break;

  case 51: /* RelExp: RelExp GT AddExp  */
#line 279 "src/parser.y"
                       {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATER, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1734 "src/parser.cpp"
    break;

  case 52: /* RelExp: RelExp GE AddExp  */
#line 283 "src/parser.y"
                       {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GE, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1743 "src/parser.cpp"
    break;

  case 53: /* EqExp: RelExp  */
#line 290 "src/parser.y"
             {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1749 "src/parser.cpp"
    break;

  case 54: /* EqExp: EqExp EQU RelExp  */
#line 291 "src/parser.y"
                       {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::EQU, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1758 "src/parser.cpp"
    break;

  case 55: /* EqExp: EqExp NE RelExp  */
#line 295 "src/parser.y"
                      {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::NE, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1767 "src/parser.cpp"
    break;

  case 56: /* LAndExp: EqExp  */
#line 302 "src/parser.y"
          {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1773 "src/parser.cpp"
    break;

  case 57: /* LAndExp: LAndExp AND EqExp  */
#line 305 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::AND, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1782 "src/parser.cpp"
    break;

  case 58: /* LOrExp: LAndExp  */
#line 312 "src/parser.y"
            {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1788 "src/parser.cpp"
    break;

  case 59: /* LOrExp: LOrExp OR LAndExp  */
#line 315 "src/parser.y"
    {
        SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::OR, (yyvsp[-2].exprtype), (yyvsp[0].exprtype));
    }
#line 1797 "src/parser.cpp"
    break;

  case 60: /* Type: INT  */
#line 321 "src/parser.y"
          {
        (yyval.type) = TypeSystem::intType;
    }
#line 1805 "src/parser.cpp"
    break;

  case 61: /* Type: VOID  */
#line 324 "src/parser.y"
           {
        (yyval.type) = TypeSystem::voidType;
    }
#line 1813 "src/parser.cpp"
    break;

  case 62: /* Type: FLOAT_DEF  */
#line 327 "src/parser.y"
                {
        (yyval.type) = TypeSystem::floatType;
    }
#line 1821 "src/parser.cpp"
    break;

  case 63: /* FuncRParams: Exp  */
#line 333 "src/parser.y"
          {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1827 "src/parser.cpp"
    break;

  case 64: /* FuncRParams: FuncRParams COMMA Exp  */
#line 334 "src/parser.y"
                            {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        (yyval.exprtype)->setnext((yyvsp[0].exprtype));
    }
#line 1836 "src/parser.cpp"
    break;

  case 65: /* DeclStmt: VarDeclStmt  */
#line 340 "src/parser.y"
                  {
        (yyval.stmttype)=(yyvsp[0].stmttype);
        fprintf(stderr, "ff1\n");
    }
#line 1845 "src/parser.cpp"
    break;

  case 66: /* DeclStmt: ConstDeclStmt  */
#line 344 "src/parser.y"
                    {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1851 "src/parser.cpp"
    break;

  case 67: /* VarDeclStmt: Type VarDefList SEMICOLON  */
#line 349 "src/parser.y"
                              {
        (yyval.stmttype)=(yyvsp[-1].stmttype);
    }
#line 1859 "src/parser.cpp"
    break;

  case 68: /* ConstDeclStmt: CONST Type ConstDefList SEMICOLON  */
#line 357 "src/parser.y"
                                      {
        (yyval.stmttype)=(yyvsp[-1].stmttype);
    }
#line 1867 "src/parser.cpp"
    break;

  case 69: /* VarDefList: VarDef  */
#line 365 "src/parser.y"
           {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 1873 "src/parser.cpp"
    break;

  case 70: /* VarDefList: VarDefList COMMA VarDef  */
#line 367 "src/parser.y"
                           {
        (yyval.stmttype)=(yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setnext((yyvsp[0].stmttype));
    }
#line 1882 "src/parser.cpp"
    break;

  case 71: /* ConstDefList: ConstDefList COMMA ConstDef  */
#line 374 "src/parser.y"
                                  {
        (yyval.stmttype) = (yyvsp[-2].stmttype);
        (yyvsp[-2].stmttype)->setnext((yyvsp[0].stmttype));
    }
#line 1891 "src/parser.cpp"
    break;

  case 72: /* ConstDefList: ConstDef  */
#line 378 "src/parser.y"
               {(yyval.stmttype) = (yyvsp[0].stmttype);}
#line 1897 "src/parser.cpp"
    break;

  case 73: /* ArrayIndices: LSBRAC ConstExp RSBRAC  */
#line 383 "src/parser.y"
                             {
        (yyval.exprtype) = (yyvsp[-1].exprtype);
    }
#line 1905 "src/parser.cpp"
    break;

  case 74: /* ArrayIndices: ArrayIndices LSBRAC ConstExp RSBRAC  */
#line 387 "src/parser.y"
                                          {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyvsp[-3].exprtype)->setnext((yyvsp[-1].exprtype));
    }
#line 1914 "src/parser.cpp"
    break;

  case 75: /* VarDef: ID  */
#line 396 "src/parser.y"
       {
        SymbolEntry *se;
        se = new IdentifierSymbolEntry(TypeSystem::intType,(yyvsp[0].strtype), identifiers->getLevel());
        //改
        if(!identifiers->install((yyvsp[0].strtype), se))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[0].strtype));
        /* 没有expr，不用单独存 */
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 1929 "src/parser.cpp"
    break;

  case 76: /* VarDef: ID ASSIGN InitVal  */
#line 406 "src/parser.y"
                        {
        SymbolEntry *se;
        se = new IdentifierSymbolEntry(TypeSystem::intType,(yyvsp[-2].strtype), identifiers->getLevel());
        if(!identifiers->install((yyvsp[-2].strtype), se))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[-2].strtype));
        ((IdentifierSymbolEntry*)se)->setValue((yyvsp[0].exprtype)->getValue());
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 1943 "src/parser.cpp"
    break;

  case 77: /* VarDef: ID ArrayIndices  */
#line 417 "src/parser.y"
                      {
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = (yyvsp[0].exprtype);
        //vec存入需要初始化的数组（如果有多维的话有多个）
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getnext());
        }
        Type *type = TypeSystem::intType;
        Type* temp1;
        while(!vec.empty()){
            //每次从vec最后取出需要创建的数组，第一个构造的默认是int类型
            temp1 = new ArrayType(type, vec.back());
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            //如果是多维数组a[m][n],先创建后面的，嵌套创建前面的数组
            type = temp1;
            vec.pop_back();
        }
        arrayType = (ArrayType*)type;
        //用最后创建的type创建符号表
        se = new IdentifierSymbolEntry(type, (yyvsp[-1].strtype), identifiers->getLevel());
        //设置全0，未初始化值
        ((IdentifierSymbolEntry*)se)->setAllZero();
        int *p = new int[type->getSize()];
        //先初始化了第一维的int数组
        ((IdentifierSymbolEntry*)se)->setArrayValue(p);
        if(!identifiers->install((yyvsp[-1].strtype), se))
            fprintf(stderr, "id \"%s\" 已定义,不能重复定义\n", (char*)(yyvsp[-1].strtype));
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 1981 "src/parser.cpp"
    break;

  case 78: /* @3: %empty  */
#line 450 "src/parser.y"
                             {
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = (yyvsp[-1].exprtype);
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getnext());
        }
        Type* type = TypeSystem::intType;
        Type* temp1;
        for(auto it = vec.rbegin(); it != vec.rend(); it++) {
            temp1 = new ArrayType(type, *it);
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
        }
        arrayType = (ArrayType*)type;
        idx = 0;
        std::stack<InitValueListExpr*>().swap(stk);
        se = new IdentifierSymbolEntry(type, (yyvsp[-2].strtype), identifiers->getLevel());
        (yyval.se) = se;
        arrayValue = new int[arrayType->getSize()];
    }
#line 2009 "src/parser.cpp"
    break;

  case 79: /* VarDef: ID ArrayIndices ASSIGN @3 InitVal  */
#line 472 "src/parser.y"
              {
        ((IdentifierSymbolEntry*)(yyvsp[-1].se))->setArrayValue(arrayValue);
        if(((InitValueListExpr*)(yyvsp[0].exprtype))->isEmpty())
            ((IdentifierSymbolEntry*)(yyvsp[-1].se))->setAllZero();
        if(!identifiers->install((yyvsp[-4].strtype), (yyvsp[-1].se)))
            fprintf(stderr, "id \"%s\" 已定义,不能重复定义\n", (char*)(yyvsp[-4].strtype));
        (yyval.stmttype) = new DeclStmt(new Id((yyvsp[-1].se)), (yyvsp[0].exprtype));
        delete [](yyvsp[-4].strtype);
    }
#line 2023 "src/parser.cpp"
    break;

  case 80: /* InitVal: Exp  */
#line 484 "src/parser.y"
          {
        // 检查是否为int
        if(!(yyvsp[0].exprtype)->getSymPtr()->getType()->isInt())
        {
            fprintf(stderr,
                "cannot initialize a variable of type \'int\' with an rvalue "
                "of type \'%s\'\n",
                (yyvsp[0].exprtype)->getSymPtr()->getType()->toStr().c_str());
        }
        (yyval.exprtype) = (yyvsp[0].exprtype); 
        //wjc arr
        if(!stk.empty()){
            arrayValue[idx++] = (yyvsp[0].exprtype)->getValue();
            Type* arrTy = stk.top()->getSymbolEntry()->getType();
            if(arrTy == TypeSystem::intType)
                stk.top()->addExpr((yyvsp[0].exprtype));
            else
                while(arrTy){
                    if(((ArrayType*)arrTy)->getElementType() != TypeSystem::intType){
                        arrTy = ((ArrayType*)arrTy)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitValueListExpr* list = new InitValueListExpr(se);
                        stk.top()->addExpr(list);
                        stk.push(list);
                    }else{
                        stk.top()->addExpr((yyvsp[0].exprtype));
                        while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                            arrTy = ((ArrayType*)arrTy)->getArrayType();
                            stk.pop();
                        }
                        break;
                    }
                }
        }
        
    }
#line 2064 "src/parser.cpp"
    break;

  case 81: /* InitVal: LBRACE RBRACE  */
#line 521 "src/parser.y"
                    {
        SymbolEntry* se;
        ExprNode* list;
        if(stk.empty()){
            // 如果只用一个{}初始化数组，那么栈一定为空
            memset(arrayValue, 0, arrayType->getSize());
            idx += arrayType->getSize() / TypeSystem::intType->getSize();
            se = new ConstantSymbolEntry(arrayType);
            list = new InitValueListExpr(se);
        }else{
            Type* type = ((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType();
            int len = type->getSize() / TypeSystem::intType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new InitValueListExpr(se);
            stk.top()->addExpr(list);
            while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                stk.pop();
            }
        }
        (yyval.exprtype) = list;
    }
#line 2092 "src/parser.cpp"
    break;

  case 82: /* @4: %empty  */
#line 544 "src/parser.y"
             {
        SymbolEntry* se;
        if(!stk.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getElementType() != TypeSystem::intType){
            arrayType = (ArrayType*)(arrayType->getElementType());
        }
        InitValueListExpr* expr = new InitValueListExpr(se);
        if(!stk.empty())
            stk.top()->addExpr(expr);
        stk.push(expr);
        (yyval.exprtype) = expr;
        leftCnt++;
    }
#line 2112 "src/parser.cpp"
    break;

  case 83: /* InitVal: LBRACE @4 InitValList RBRACE  */
#line 559 "src/parser.y"
                         {
        leftCnt--;
        while(stk.top() != (yyvsp[-2].exprtype) && stk.size() > (long unsigned int)(leftCnt + 1))
            stk.pop();
        if(stk.top() == (yyvsp[-2].exprtype))
            stk.pop();
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        if(!stk.empty())
            while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                stk.pop();
            }
        int size = ((ArrayType*)((yyval.exprtype)->getSymbolEntry()->getType()))->getSize()/ TypeSystem::intType->getSize();
        while(idx % size != 0)
            arrayValue[idx++] = 0;
        if(!stk.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType());
    
    }
#line 2135 "src/parser.cpp"
    break;

  case 84: /* ConstDef: ID ASSIGN ConstInitVal  */
#line 581 "src/parser.y"
                             {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::constIntType, (yyvsp[-2].strtype), identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();//ffclab6
        if(!identifiers->install((yyvsp[-2].strtype), se))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[-2].strtype));
        ((IdentifierSymbolEntry*)se)->setValue((yyvsp[0].exprtype)->getValue());
        /* */
        (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
        delete [](yyvsp[-2].strtype);
    }
#line 2151 "src/parser.cpp"
    break;

  case 85: /* @5: %empty  */
#line 593 "src/parser.y"
                              {
        SymbolEntry* se;
        std::vector<int> vec;
        ExprNode* temp = (yyvsp[-1].exprtype);
        while(temp){
            vec.push_back(temp->getValue());
            temp = (ExprNode*)(temp->getnext());
        }
        Type* type = TypeSystem::constIntType;
        Type* temp1;
        for(auto it = vec.rbegin(); it != vec.rend(); it++) {
            temp1 = new ArrayType(type, *it, true);
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp1);
            type = temp1;
        }
        arrayType = (ArrayType*)type;
        idx = 0;
        std::stack<InitValueListExpr*>().swap(stk);
        se = new IdentifierSymbolEntry(type, (yyvsp[-2].strtype), identifiers->getLevel());
        // m7
        ((IdentifierSymbolEntry*)se)->setConst();
        (yyval.se) = se;
        arrayValue = new int[arrayType->getSize()];
    }
#line 2181 "src/parser.cpp"
    break;

  case 86: /* ConstDef: ID ArrayIndices ASSIGN @5 ConstInitVal  */
#line 618 "src/parser.y"
                   {
        ((IdentifierSymbolEntry*)(yyvsp[-1].se))->setArrayValue(arrayValue);
        if(!identifiers->install((yyvsp[-4].strtype), (yyvsp[-1].se)))
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)(yyvsp[-4].strtype));
        identifiers->install((yyvsp[-4].strtype), (yyvsp[-1].se));
        (yyval.stmttype) = new DeclStmt(new Id((yyvsp[-1].se)), (yyvsp[0].exprtype));
        delete [](yyvsp[-4].strtype);
    }
#line 2194 "src/parser.cpp"
    break;

  case 87: /* ConstInitVal: ConstExp  */
#line 629 "src/parser.y"
               {
        if(!(yyvsp[0].exprtype)->getSymPtr()->getType()->isInt())
        {
            fprintf(stderr,
                "cannot initialize a const of type \'int\' with an rvalue "
                "of type \'%s\'\n",
                (yyvsp[0].exprtype)->getSymPtr()->getType()->toStr().c_str());
        }
        (yyval.exprtype) = (yyvsp[0].exprtype);
        //wjc arr
        if(!stk.empty()){
            arrayValue[idx++] = (yyvsp[0].exprtype)->getValue();
            Type* arrTy = stk.top()->getSymbolEntry()->getType();
            if(arrTy == TypeSystem::constIntType)
                stk.top()->addExpr((yyvsp[0].exprtype));
            else
                while(arrTy){
                    if(((ArrayType*)arrTy)->getElementType() != TypeSystem::constIntType){
                        arrTy = ((ArrayType*)arrTy)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(arrTy);
                        InitValueListExpr* list = new InitValueListExpr(se);
                        stk.top()->addExpr(list);
                        stk.push(list);
                    }else{
                        stk.top()->addExpr((yyvsp[0].exprtype));
                        while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                            arrTy = ((ArrayType*)arrTy)->getArrayType();
                            stk.pop();
                        }
                        break;
                    }
                }
        }
    }
#line 2233 "src/parser.cpp"
    break;

  case 88: /* ConstInitVal: LBRACE RBRACE  */
#line 664 "src/parser.y"
                    {
        SymbolEntry* se;
        ExprNode* list;
        if(stk.empty()){
            // 如果只用一个{}初始化数组，那么栈一定为空
            // 此时也没必要再加入栈了
            memset(arrayValue, 0, arrayType->getSize());
            idx += arrayType->getSize() / TypeSystem::constIntType->getSize();
            se = new ConstantSymbolEntry(arrayType);
            list = new InitValueListExpr(se);
        }else{
            // 栈不空说明肯定不是只有{}
            // 此时需要确定{}到底占了几个元素
            Type* type = ((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType();
            int len = type->getSize() / TypeSystem::constIntType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new InitValueListExpr(se);
            stk.top()->addExpr(list);
            while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                stk.pop();
            }
        }
        (yyval.exprtype) = list;
    }
#line 2264 "src/parser.cpp"
    break;

  case 89: /* @6: %empty  */
#line 690 "src/parser.y"
             {
        SymbolEntry* se;
        if(!stk.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(arrayType);
        if(arrayType->getElementType() != TypeSystem::intType){
            arrayType = (ArrayType*)(arrayType->getElementType());
        }
        InitValueListExpr* expr = new InitValueListExpr(se);
        if(!stk.empty())
            stk.top()->addExpr(expr);
        stk.push(expr);
        (yyval.exprtype) = expr;
        leftCnt++;
    }
#line 2284 "src/parser.cpp"
    break;

  case 90: /* ConstInitVal: LBRACE @6 ConstInitValList RBRACE  */
#line 705 "src/parser.y"
                              {
        leftCnt--;
        while(stk.top() != (yyvsp[-2].exprtype) && stk.size() > (long unsigned int)(leftCnt + 1))
            stk.pop();
        if(stk.top() == (yyvsp[-2].exprtype))
            stk.pop();
        (yyval.exprtype) = (yyvsp[-2].exprtype);
        if(!stk.empty())
            while(stk.top()->isFull() && stk.size() != (long unsigned int)leftCnt){
                stk.pop();
            }
        while(idx % (((ArrayType*)((yyval.exprtype)->getSymbolEntry()->getType()))->getSize()/ sizeof(int)) !=0 )
            arrayValue[idx++] = 0;
        if(!stk.empty())
            arrayType = (ArrayType*)(((ArrayType*)(stk.top()->getSymbolEntry()->getType()))->getElementType());
    }
#line 2305 "src/parser.cpp"
    break;

  case 91: /* InitValList: InitVal  */
#line 725 "src/parser.y"
              {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 2313 "src/parser.cpp"
    break;

  case 92: /* InitValList: InitValList COMMA InitVal  */
#line 728 "src/parser.y"
                                {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
    }
#line 2321 "src/parser.cpp"
    break;

  case 93: /* ConstInitValList: ConstInitVal  */
#line 733 "src/parser.y"
                   {
        (yyval.exprtype) = (yyvsp[0].exprtype);
    }
#line 2329 "src/parser.cpp"
    break;

  case 94: /* ConstInitValList: ConstInitValList COMMA ConstInitVal  */
#line 736 "src/parser.y"
                                          {
        (yyval.exprtype) = (yyvsp[-2].exprtype);
    }
#line 2337 "src/parser.cpp"
    break;

  case 95: /* $@7: %empty  */
#line 743 "src/parser.y"
            {
        identifiers = new SymbolTable(identifiers);
        fprintf(stderr, "函数总该有吧\n");
        paramNo = 0;//ffclab6
    }
#line 2347 "src/parser.cpp"
    break;

  case 96: /* @8: %empty  */
#line 749 "src/parser.y"
    {
        Type* funcType;
        std::vector<Type*> paramType;
        std::vector<SymbolEntry*> params;
        DeclStmt* temp = (DeclStmt*)(yyvsp[-1].stmttype);
        while(temp){
            paramType.push_back(temp->getId()->getSymPtr()->getType());
            params.push_back(temp->getId()->getSymPtr());
            temp = (DeclStmt*)(temp->getnext());
        }
        funcType = new FunctionType((yyvsp[-5].type), paramType,params);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, (yyvsp[-4].strtype), identifiers->getPrev()->getLevel());
        // identifiers->getPrev()->install($2, se);
        // 检验函数重定义
         if(!identifiers->getPrev()->install((yyvsp[-4].strtype), se)){
            fprintf(stderr, "redefinition of \'%s %s\'\n", (yyvsp[-4].strtype), se->getType()->toStr().c_str());
        }
        (yyval.se) = se; 
    }
#line 2371 "src/parser.cpp"
    break;

  case 97: /* FuncDef: Type ID $@7 LPAREN FUNCPARAMS RPAREN @8 BlockStmt  */
#line 769 "src/parser.y"
    {
        FunctionDef *f = new FunctionDef((yyvsp[-1].se), (DeclStmt*)(yyvsp[-3].stmttype), (yyvsp[0].stmttype));
        fprintf(stderr, "是你是你1\n");
        f->setRet(ret);
        fprintf(stderr, "是你是你2\n");
        (yyval.stmttype)=f;
        ret=nullptr;
        SymbolTable* top = identifiers;
        fprintf(stderr, "是你是你3\n");
        identifiers = identifiers->getPrev();
        fprintf(stderr, "是你是你4\n");
        delete top;
        fprintf(stderr, "是你是你5\n");
        delete [](yyvsp[-6].strtype);
        fprintf(stderr, "是你是你6\n");
    }
#line 2392 "src/parser.cpp"
    break;

  case 98: /* FUNCPARAMS: PARAMS  */
#line 789 "src/parser.y"
             {(yyval.stmttype)=(yyvsp[0].stmttype);}
#line 2398 "src/parser.cpp"
    break;

  case 99: /* FUNCPARAMS: %empty  */
#line 790 "src/parser.y"
             {(yyval.stmttype)=nullptr;}
#line 2404 "src/parser.cpp"
    break;

  case 100: /* PARAMS: PARAMS COMMA PARAM  */
#line 795 "src/parser.y"
                         {
        (yyval.stmttype)=(yyvsp[-2].stmttype);
        (yyval.stmttype)->setnext((yyvsp[0].stmttype));
    }
#line 2413 "src/parser.cpp"
    break;

  case 101: /* PARAMS: PARAM  */
#line 799 "src/parser.y"
            {
        (yyval.stmttype)=(yyvsp[0].stmttype);
    }
#line 2421 "src/parser.cpp"
    break;

  case 102: /* PARAM: Type ID  */
#line 806 "src/parser.y"
              {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry((yyvsp[-1].type), (yyvsp[0].strtype), identifiers->getLevel(),paramNo++);//ffclab6
        identifiers->install((yyvsp[0].strtype), se);
        /* 返回的是DeclStmt类型的节点 */
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[0].strtype);
    }
#line 2436 "src/parser.cpp"
    break;

  case 103: /* PARAM: Type ID FuncArrayIndices  */
#line 818 "src/parser.y"
                               {
        SymbolEntry* se;
        ExprNode* temp = (yyvsp[0].exprtype);
        Type* arr = TypeSystem::intType;
        Type* arr1;
        std::stack<ExprNode*> stk;
        while(temp){
            stk.push(temp);
            temp = (ExprNode*)(temp->getnext());
        }
        while(!stk.empty()){
            arr1 = new ArrayType(arr, stk.top()->getValue());
            if(arr->isArray())
                ((ArrayType*)arr)->setArrayType(arr1);
            arr = arr1;
            stk.pop();
        }
        se = new IdentifierSymbolEntry(arr, (yyvsp[-1].strtype), identifiers->getLevel(), paramNo++);// lab6arr
        identifiers->install((yyvsp[-1].strtype), se);
        // end
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        (yyval.stmttype) = new DeclStmt(new Id(se));
        delete [](yyvsp[-1].strtype);
    }
#line 2466 "src/parser.cpp"
    break;

  case 104: /* FuncArrayIndices: LSBRAC RSBRAC  */
#line 847 "src/parser.y"
                    {
        (yyval.exprtype) = new ExprNode(nullptr);
    }
#line 2474 "src/parser.cpp"
    break;

  case 105: /* FuncArrayIndices: FuncArrayIndices LSBRAC Exp RSBRAC  */
#line 850 "src/parser.y"
                                         {
        (yyval.exprtype) = (yyvsp[-3].exprtype);
        (yyval.exprtype)->setnext((yyvsp[-1].exprtype));
    }
#line 2483 "src/parser.cpp"
    break;

  case 106: /* ExprStmt: Exp SEMICOLON  */
#line 859 "src/parser.y"
                 {
        (yyval.stmttype)=new ExprStmt((yyvsp[-1].exprtype));
    }
#line 2491 "src/parser.cpp"
    break;

  case 107: /* @9: %empty  */
#line 867 "src/parser.y"
                            {
        WhileStmt *whileNode = new WhileStmt((yyvsp[-1].exprtype));
        (yyval.stmttype) = whileNode;
        whileStack.push(whileNode);
    }
#line 2501 "src/parser.cpp"
    break;

  case 108: /* WhileStmt: WHILE LPAREN Cond RPAREN @9 Stmt  */
#line 871 "src/parser.y"
          {
        //获取上一个规则定义的whilenode对象
        StmtNode *whileNode = (yyvsp[-1].stmttype); 
        ((WhileStmt*)whileNode)->setStmt((yyvsp[0].stmttype));
        (yyval.stmttype)=whileNode;
        whileStack.pop();
    }
#line 2513 "src/parser.cpp"
    break;

  case 109: /* BreakStmt: BREAK SEMICOLON  */
#line 886 "src/parser.y"
                   {
        if(whileStack.empty())
        {
            fprintf(stderr, "\'break\' statement is not in while statement, so run failed.\n");
        }
        //取出栈顶的while，也就是匹配break的while
        (yyval.stmttype) = new BreakStmt(whileStack.top());
    }
#line 2526 "src/parser.cpp"
    break;

  case 110: /* ContinueStmt: CONTINUE SEMICOLON  */
#line 899 "src/parser.y"
                      {
        if(whileStack.empty())
        {
            fprintf(stderr, "\'continue\' statement is not in while statement, so run failed.\n");
        }
        (yyval.stmttype) = new ContinueStmt(whileStack.top());
    }
#line 2538 "src/parser.cpp"
    break;


#line 2542 "src/parser.cpp"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 907 "src/parser.y"


int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
