%{
#include "scompiler.tab.h"
%}
increaser "++"|"--"
%%
"//"                     {return END;}
"ent"                   {return ENT;}
"text"                   {return TEXT;}
"dec"                   {return DEC;}
"cond"                   {return COND;}
"init"                    {return INIT;}
"fr "                    {return FR;}
"["                     {return APC;}
"]"                     {return CPC;}
":"                     {return ASI;}
,			            {return COM;}
";"                     {return PYC;}
"{"                     {return ACO;}
"}"                     {return CCO;}
"<"                     {return MEN;}
"<="                    {return MEI;}
">"                     {return MAY;}
">="                    {return MAI;}
"="                     {return IGU;}
"=!"                    {return NIG;}
"&"                     {return Y;}
"|"                     {return O;}
{increaser}             {return INC;}
"ms"                    {return MS;}
"sisas"                 {return SIS;}
"nospi"                 {return NOS;}
"veo"                   {return VEO;}
\+			            {return SUM;}
\*			            {return MUL;}
\-			            {return RES;}
\/			            {return DIV;}
"try"                    {return TRY;}
"catch"                    {return CATCH;}
[A-Za-z0-9]+		{return ITK;}
[ \t\n]                 {/*Se ignoran los espacios*/}
.			{printf("Error léxico: %s\n", yytext);}
%%
int yywrap(){return 1;}
