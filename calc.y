%{ 
# include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(char *a);
%}
%union{
int no;
char* ID;
}
%type <no> expr
%token ID
%token <no> NUM
%left '+''-'
%left '*''/'
%%
stmt :expr
expr :expr '+' expr {$$=$1+$3;
                    printf("%d",$$);}
     |expr '-' expr {$$=$1-$3;
		     printf("%d",$$);}	
     |expr '*' expr{$$=$1*$3;
		     printf("%d",$$);}	
     |expr '/' expr{$$=$1/$3;
		     printf("%d",$$);}	
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
	{ printf("invalid expression");
	  exit(0);
	  return(0);
	}

