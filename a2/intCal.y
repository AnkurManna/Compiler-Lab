%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
void yyerror(char *msg);
%}

%union {
  int f;
}

%token <f> NUM
%type <f> D E T F

%%

S : D           {printf("%d\n", $1);}
  ;

D : D '&' E     {$$ = $1 & $3;}
  | D '|' E     {$$ = $1 | $3;}
  | E           {$$ = $1;}
  ;

E : E '+' T     {$$ = $1 + $3;}
  | E '-' T     {$$ = $1 - $3;}
  | T           {$$ = $1;}
  ;

T : T '*' F     {$$ = $1 * $3;}
  | T '/' F     {$$ = $1 / $3;}
  | F           {$$ = $1;}
  ;

F : '(' D ')'   {$$ = $2;}
  | '-' F       {$$ = -$2;}
  | NUM         {$$ = $1;}
  ;

%%

void yyerror(char *msg) {
    fprintf(stderr, "%s\n", msg);
    exit(1);
}

int main() {
    yyparse();
    return 0;
}