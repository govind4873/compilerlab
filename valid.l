%{
  #include <stdio.h> 
  #include "valid.tab.h"
%}
%%
[a-z A-Z][a-z A-Z] {return LETTER;}
[_] {return UNDERSCORE;}
[0-9] {return NUM;}
\n {return 0;}
%%
int yywrap()
{return(1);
}
