%{ 
# include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(char *a);
%}
%token ID
%token NUM
%left '+''-'
%left '*''/'
%%
stmt :expr
expr :expr '+' expr
     |expr '-' expr	
     |expr '*' expr	
     |expr '/' expr	
     |'(' expr ')'
     |NUM 
     |ID
	;
%%
void main()
   {
	printf(" Enter the Expression \n");
	yyparse();
   }
	int yyerror (char *a)
	{ printf("invalid variable");
	  exit(0);
	  return(0);
	}

