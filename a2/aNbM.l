%{
#include<stdio.h>
int A=0,B=0;
%}
lang [a]*[b]*
%%
{lang} {

    printf("Correct Grammar");
}
.+ {printf("\nIncorrect Grammer");A=B=0;}
%%

int yywrap(void){} 
void main()
{
yylex();
}