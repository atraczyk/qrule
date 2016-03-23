/* This Bison file was machine-generated by BNFC */
%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <iostream>
#include <algorithm>
#include "Absyn.H"
typedef struct yy_buffer_state *YY_BUFFER_STATE;
int yyparse(void);
int yylex(void);
YY_BUFFER_STATE yy_scan_string(const char *str);
void yy_delete_buffer(YY_BUFFER_STATE buf);
int yy_mylinenumber;
int initialize_lexer(FILE * inp);
int yywrap(void)
{
  return 1;
}
void yyerror(const char *str)
{
  extern char *yytext;
  fprintf(stderr,"error: line %d: %s at %s\n", 
    yy_mylinenumber, str, yytext);
}



static RuleSet* YY_RESULT_RuleSet_ = 0;
RuleSet* pRuleSet(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_RuleSet_;
  }
}
RuleSet* pRuleSet(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_RuleSet_;
  }
}

static Rule* YY_RESULT_Rule_ = 0;
Rule* pRule(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Rule_;
  }
}
Rule* pRule(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Rule_;
  }
}

static ASTScope* YY_RESULT_ASTScope_ = 0;
ASTScope* pASTScope(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_ASTScope_;
  }
}
ASTScope* pASTScope(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_ASTScope_;
  }
}

static RuleCause* YY_RESULT_RuleCause_ = 0;
RuleCause* pRuleCause(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_RuleCause_;
  }
}
RuleCause* pRuleCause(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_RuleCause_;
  }
}

static Explanation* YY_RESULT_Explanation_ = 0;
Explanation* pExplanation(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Explanation_;
  }
}
Explanation* pExplanation(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Explanation_;
  }
}

static ListRule* YY_RESULT_ListRule_ = 0;
ListRule* pListRule(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_ListRule_;
  }
}
ListRule* pListRule(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_ListRule_;
  }
}

static Tag* YY_RESULT_Tag_ = 0;
Tag* pTag(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Tag_;
  }
}
Tag* pTag(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Tag_;
  }
}

static Severity* YY_RESULT_Severity_ = 0;
Severity* pSeverity(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Severity_;
  }
}
Severity* pSeverity(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Severity_;
  }
}

static OverPaths* YY_RESULT_OverPaths_ = 0;
OverPaths* pOverPaths(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_OverPaths_;
  }
}
OverPaths* pOverPaths(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_OverPaths_;
  }
}

static PathSpecific* YY_RESULT_PathSpecific_ = 0;
PathSpecific* pPathSpecific(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_PathSpecific_;
  }
}
PathSpecific* pPathSpecific(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_PathSpecific_;
  }
}

static IStmnt* YY_RESULT_IStmnt_ = 0;
IStmnt* pIStmnt(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_IStmnt_;
  }
}
IStmnt* pIStmnt(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_IStmnt_;
  }
}

static IExpr* YY_RESULT_IExpr_ = 0;
IExpr* pIExpr(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_IExpr_;
  }
}
IExpr* pIExpr(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_IExpr_;
  }
}

static Expr* YY_RESULT_Expr_ = 0;
Expr* pExpr(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Expr_;
  }
}
Expr* pExpr(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Expr_;
  }
}

static ListExpr* YY_RESULT_ListExpr_ = 0;
ListExpr* pListExpr(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_ListExpr_;
  }
}
ListExpr* pListExpr(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_ListExpr_;
  }
}

static Type* YY_RESULT_Type_ = 0;
Type* pType(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Type_;
  }
}
Type* pType(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Type_;
  }
}

static Param* YY_RESULT_Param_ = 0;
Param* pParam(FILE *inp)
{
  yy_mylinenumber = 1;
  initialize_lexer(inp);
  if (yyparse())
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Param_;
  }
}
Param* pParam(const char *str)
{
  YY_BUFFER_STATE buf;
  int result;
  yy_mylinenumber = 1;
  initialize_lexer(0);
  buf = yy_scan_string(str);
  result = yyparse();
  yy_delete_buffer(buf);
  if (result)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return YY_RESULT_Param_;
  }
}



%}

%union
{
  int int_;
  char char_;
  double double_;
  char* string_;
  RuleSet* ruleset_;
  Rule* rule_;
  ASTScope* astscope_;
  RuleCause* rulecause_;
  Explanation* explanation_;
  ListRule* listrule_;
  Tag* tag_;
  Severity* severity_;
  OverPaths* overpaths_;
  PathSpecific* pathspecific_;
  IStmnt* istmnt_;
  IExpr* iexpr_;
  Expr* expr_;
  ListExpr* listexpr_;
  Type* type_;
  Param* param_;
}

%token _ERROR_
%token _SYMB_0    //   ::
%token _SYMB_1    //   ??
%token _SYMB_2    //   
%token _SYMB_3    //   ,
%token _SYMB_4    //   <=
%token _SYMB_5    //   >=
%token _SYMB_6    //   <
%token _SYMB_7    //   >
%token _SYMB_8    //   =
%token _SYMB_9    //   (
%token _SYMB_10    //   )
%token _SYMB_11    //   !
%token _SYMB_12    //   ->
%token _SYMB_13    //   &
%token _SYMB_14    //   |
%token _SYMB_15    //   A
%token _SYMB_16    //   Critical
%token _SYMB_17    //   E
%token _SYMB_18    //   F
%token _SYMB_19    //   False
%token _SYMB_20    //   File
%token _SYMB_21    //   G
%token _SYMB_22    //   Globally
%token _SYMB_23    //   Imported
%token _SYMB_24    //   Language
%token _SYMB_25    //   Policy
%token _SYMB_26    //   True
%token _SYMB_27    //   U
%token _SYMB_28    //   Warning
%token _SYMB_29    //   X
%token _SYMB_30    //   nrChildren
%token _SYMB_31    //   type
%token _SYMB_32    //   value

%type <ruleset_> RuleSet
%type <rule_> Rule
%type <astscope_> ASTScope
%type <rulecause_> RuleCause
%type <explanation_> Explanation
%type <listrule_> ListRule
%type <tag_> Tag
%type <severity_> Severity
%type <overpaths_> OverPaths
%type <pathspecific_> PathSpecific
%type <istmnt_> IStmnt
%type <iexpr_> IExpr2
%type <iexpr_> IExpr1
%type <iexpr_> IExpr
%type <expr_> Expr10
%type <expr_> Expr9
%type <expr_> Expr8
%type <expr_> Expr7
%type <expr_> Expr6
%type <expr_> Expr4
%type <expr_> Expr2
%type <expr_> Expr
%type <expr_> Expr1
%type <expr_> Expr3
%type <expr_> Expr5
%type <listexpr_> ListExpr
%type <type_> Type
%type <param_> Param

%start RuleSet
%token<string_> _STRING_
%token<int_> _INTEGER_

%%
RuleSet : ListRule {  std::reverse($1->begin(),$1->end()) ;$$ = new RSet($1); YY_RESULT_RuleSet_= $$; } 
;
Rule : Tag Severity RuleCause ASTScope Explanation _SYMB_0 Expr {  $$ = new RRule($1, $2, $3, $4, $5, $7); YY_RESULT_Rule_= $$; } 
;
ASTScope : _SYMB_22 {  $$ = new ASTGlobally(); YY_RESULT_ASTScope_= $$; } 
  | _SYMB_20 {  $$ = new ASTFile(); YY_RESULT_ASTScope_= $$; }
  | _SYMB_23 {  $$ = new ASTImported(); YY_RESULT_ASTScope_= $$; }
;
RuleCause : _SYMB_24 {  $$ = new RCLang(); YY_RESULT_RuleCause_= $$; } 
  | _SYMB_25 {  $$ = new RCPolicy(); YY_RESULT_RuleCause_= $$; }
;
Explanation : _SYMB_1 _STRING_ {  $$ = new Explan($2); YY_RESULT_Explanation_= $$; } 
  | _SYMB_2 {  $$ = new Noexplan(); YY_RESULT_Explanation_= $$; }
;
ListRule : /* empty */ {  $$ = new ListRule(); YY_RESULT_ListRule_= $$; } 
  | Rule {  $$ = new ListRule() ; $$->push_back($1); YY_RESULT_ListRule_= $$; }
  | Rule _SYMB_3 ListRule {  $3->push_back($1) ; $$ = $3 ; YY_RESULT_ListRule_= $$; }
;
Tag : _STRING_ {  $$ = new TTag($1); YY_RESULT_Tag_= $$; } 
;
Severity : _SYMB_28 {  $$ = new SevWarning(); YY_RESULT_Severity_= $$; } 
  | _SYMB_16 {  $$ = new SevCritical(); YY_RESULT_Severity_= $$; }
;
OverPaths : _SYMB_15 PathSpecific {  $$ = new All($2); YY_RESULT_OverPaths_= $$; } 
  | _SYMB_17 PathSpecific {  $$ = new Exist($2); YY_RESULT_OverPaths_= $$; }
;
PathSpecific : _SYMB_18 Expr {  $$ = new Future($2); YY_RESULT_PathSpecific_= $$; } 
  | _SYMB_21 Expr {  $$ = new Globally($2); YY_RESULT_PathSpecific_= $$; }
  | Expr _SYMB_27 Expr {  $$ = new Until($1, $3); YY_RESULT_PathSpecific_= $$; }
  | _SYMB_29 Expr {  $$ = new Next($2); YY_RESULT_PathSpecific_= $$; }
;
IStmnt : _INTEGER_ {  $$ = new IEInt($1); YY_RESULT_IStmnt_= $$; } 
  | _SYMB_30 {  $$ = new IENrChildren(); YY_RESULT_IStmnt_= $$; }
;
IExpr2 : IExpr1 _SYMB_4 IStmnt {  $$ = new IELtEq($1, $3); YY_RESULT_IExpr_= $$; } 
  | IExpr1 _SYMB_5 IStmnt {  $$ = new IEGtEq($1, $3); YY_RESULT_IExpr_= $$; }
  | IExpr1 _SYMB_6 IStmnt {  $$ = new IELt($1, $3); YY_RESULT_IExpr_= $$; }
  | IExpr1 _SYMB_7 IStmnt {  $$ = new IEGt($1, $3); YY_RESULT_IExpr_= $$; }
  | IStmnt _SYMB_8 IStmnt {  $$ = new IEq($1, $3); YY_RESULT_IExpr_= $$; }
  | _SYMB_9 IExpr _SYMB_10 {  $$ = $2; YY_RESULT_IExpr_= $$; }
;
IExpr1 : IStmnt {  $$ = new IEStmnt($1); YY_RESULT_IExpr_= $$; } 
  | IExpr2 {  $$ = $1; YY_RESULT_IExpr_= $$; }
;
IExpr : IExpr1 {  $$ = $1; YY_RESULT_IExpr_= $$; } 
;
Expr10 : _SYMB_26 {  $$ = new ETrue(); YY_RESULT_Expr_= $$; } 
  | _SYMB_19 {  $$ = new EFalse(); YY_RESULT_Expr_= $$; }
  | _SYMB_32 _STRING_ {  $$ = new ENodeVal($2); YY_RESULT_Expr_= $$; }
  | _SYMB_31 Type {  $$ = new EType($2); YY_RESULT_Expr_= $$; }
  | _SYMB_9 Expr1 _SYMB_10 {  $$ = new EParant($2); YY_RESULT_Expr_= $$; }
  | _SYMB_9 Expr _SYMB_10 {  $$ = $2; YY_RESULT_Expr_= $$; }
;
Expr9 : _SYMB_11 Expr10 {  $$ = new ENot($2); YY_RESULT_Expr_= $$; } 
  | Expr10 {  $$ = $1; YY_RESULT_Expr_= $$; }
;
Expr8 : Expr8 _SYMB_12 Expr9 {  $$ = new EImpl($1, $3); YY_RESULT_Expr_= $$; } 
  | Expr9 {  $$ = $1; YY_RESULT_Expr_= $$; }
;
Expr7 : IExpr2 {  $$ = new EIExpr($1); YY_RESULT_Expr_= $$; } 
  | Expr8 {  $$ = $1; YY_RESULT_Expr_= $$; }
;
Expr6 : Expr6 _SYMB_8 Expr7 {  $$ = new EEq($1, $3); YY_RESULT_Expr_= $$; } 
  | Expr7 {  $$ = $1; YY_RESULT_Expr_= $$; }
;
Expr4 : Expr4 _SYMB_13 Expr5 {  $$ = new EAnd($1, $3); YY_RESULT_Expr_= $$; } 
  | Expr4 _SYMB_14 Expr5 {  $$ = new EOr($1, $3); YY_RESULT_Expr_= $$; }
  | Expr5 {  $$ = $1; YY_RESULT_Expr_= $$; }
;
Expr2 : OverPaths {  $$ = new EOverPaths($1); YY_RESULT_Expr_= $$; } 
  | Expr3 {  $$ = $1; YY_RESULT_Expr_= $$; }
;
Expr : Expr1 {  $$ = $1; YY_RESULT_Expr_= $$; } 
;
Expr1 : Expr2 {  $$ = $1; YY_RESULT_Expr_= $$; } 
;
Expr3 : Expr4 {  $$ = $1; YY_RESULT_Expr_= $$; } 
;
Expr5 : Expr6 {  $$ = $1; YY_RESULT_Expr_= $$; } 
;
ListExpr : /* empty */ {  $$ = new ListExpr(); YY_RESULT_ListExpr_= $$; } 
  | ListExpr Expr {  $1->push_back($2) ; $$ = $1 ; YY_RESULT_ListExpr_= $$; }
;
Type : _STRING_ {  $$ = new TType($1); YY_RESULT_Type_= $$; } 
;
Param : _STRING_ {  $$ = new PParam($1); YY_RESULT_Param_= $$; } 
;
