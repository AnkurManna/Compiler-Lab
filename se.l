/* Lex Program to accept string starting with vowel */
% { 
int flag = 0; 
% } 

%% 

[aeiouAEIOU].[a-zA-Z0-9.]+ flag=1; 
[a-zA-Z0-9]+ 

%% 

main() 
{ 
yylex(); 
if (flag == 1) 
	printf("Accepted"); 
else
	printf("Not Accepted"); 
} 
