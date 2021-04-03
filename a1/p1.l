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
			

"\n" {ln++; printf("%d %d %d\n", ch,i,ln); i = 0;} 
%% 

int yywrap(void){} 

int main() 
{ 
	// The function that starts the analysis 
	yylex(); 

	return 0; 
} 
