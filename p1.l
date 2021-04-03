/*lex program to count number of words*/
%{ 
#include<stdio.h> 
#include<string.h> 
int i = 0; 
int ch=0;
int ln=0;
%} 

/* Rules Section*/
%% 
([a-zA-Z0-9])* {i++;} /* Rule for counting number of words*/

. {ch++;}
			

"\n" {ln++; } 
%% 

int yywrap(void){} 

int main(int argc ,char* argv[]) 
{ 
	if(argc > 1)
	{
		FILE *fp = fopen(argv[1], "r");
		if(fp)
			yyin = fp;
	}
	yylex();
	
	printf("%d %d %d",i,ch,ln);

	return 0; 
} 
