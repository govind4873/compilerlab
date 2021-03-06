%{
	int comment=0;
%}
identifier [a-zA-Z][a-zA-Z0-9]*
%%

	#.* {printf(" \n\t%s is a preprocessor directive",yytext);}
	int|float|char|double|while|for|struct|typeof|do|if|break|continue|void|switch|return|goto|else {printf(\n\t%s is a keyword",yytext);}
 	"/*" {comment=1;} {printf("\n\t %s is a comment",yytext);}
	"*/" {comment=0;} {printf("\n\t %s end of comment",yytext);}
	{identifier}\( {if(!comment)printf("\n Function \n\t%s ",yytext);}
	\{ {if(!comment) printf("\n Block begins ");}
	\} {if(!comment)printf("\n block ends");}
	{identifier}(\[[0-9]*\])? {if(!comment)printf("\n%s identifier",yytext);}
	\".*\" {if(!comment)printf("\n%s is a string",yytext);}
	\'[a-z,A-Z] \' {if(!comment)printf("\n%s is a character",yytext);}
	[0-9]+ {if(!comment)printf("\n%s is an integer",yytext);}
	\)(\:)? {if(!comment)printf("\t");ECHO;printf("\n");}
	\( ECHO; 
	\/ {if(!comment)printf("\n%s is a divison operator",yytext);}
	\+ {if(!comment)printf("\n%s is a addition operator",yytext);}
	\- {if(!comment)printf("\n%s is a substraction operator",yytext);}
	\* {if(!comment)printf("\n%s is a multiplication operator",yytext);}
	= {if(!comment)printf("\n%s is a assignment operator",yytext);}
	\<=|\>=|\>|\<|== {if(!comment)printf("\n%s is a relational operator",yytext);}
	%%
int main(int argc,char **argv)
{
		FILE *file;
		file=fopen(try.c,"r");
		if(!file)
		{
			printf("cannot open file");
			exit(0);
		}
	yyin=file;			
	yylex();
	printf("\n");
	return(0);
}
int yywrap()
	{return (1);
	}
	
		
