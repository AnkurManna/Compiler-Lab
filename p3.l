%{ 
	int vow_count=0; 
	int const_count =0; 
%} 

ALPHA [a-zA-Z0-9]
%% 

[aeiouAEIOU][A-Za-z]+  {vow_count++;} 
               
[aeiouAEIOU]           {vow_count++;}  

[A-Za-z(^aeiouAEIOU)][A-Za-z]+ {const_count++;}

"\n" {printf("%d\n", vow_count);  vow_count = 0;} 
%% 
int yywrap(){} 
int main() 
{ 
	printf("Enter the string of vowels and consonents:"); 
	yylex(); 
	
	return 0; 
} 
