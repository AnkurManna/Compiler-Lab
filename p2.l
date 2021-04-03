

%{ 
    
#include<stdio.h> 


	/* Definition section */
	int integer=0; 
	
	int fractions=0; 
	
%} 

/* Rule Section */
DIGIT [0-9] 
%% 

\-?{DIGIT}+			 {integer++;} 


\-?{DIGIT}*\.{DIGIT}+ {fractions++;} 


"\n"	{
            printf("\nNo. of Integers: %d", integer);
            integer = 0;
            printf("\nNo. of  fractions: %d", fractions); 
            fractions = 0;
	 }
 
%% 
int yywrap(void){} 
// driver code 
int main() 
{ 
	yylex(); 

	return 0; 
} 
