%{
  #include <stdio.h> 
  #include "arth.tab.h"
%}
%%
[a-z A-Z][a-z A-Z 0-9]* {return ID;}
[0-9]+ {return NUM;}
\n {return 0;}
. {return yytext[0];}
%%
int yywrap()
{return(1);
}

