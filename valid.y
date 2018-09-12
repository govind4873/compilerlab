%{ 
# include<stdio.h>
#include<stdlib.h>
int yylex();
int yyerror(char *a);
%}
%token LETTER
%token NUM
%token UNDERSCORE
%%
variable :LETTER extra {printf("\n \t valid variable");exit(0);}
extra :extra LETTER
      |extra NUM
      |LETTER
      |NUM
      |UNDERSCORE
	;
%%
void main()
   {
	printf(" Enter the variable \n");
	yyparse();
   }
	int yyerror (char *a)
	{ printf("invalid variable");
	  exit(0);
	  return(0);
	}

