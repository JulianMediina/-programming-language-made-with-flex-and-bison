%{
#include "scompiler.tab.h"
#include <stdio.h>

extern int yylineno;  // Variable global proporcionada por Flex para el número de línea
extern char* yytext;  // Variable global proporcionada por Flex para el texto actual
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

[ \t]+                  ;  // Ignorar espacios y tabulaciones

\n                      { yylineno++; }  // Contar el número de líneas

.			{printf("Error léxico: Caracter no reconocido '%s' en la línea %d\n", yytext, yylineno);}
%%

int yywrap() {
    return 1;
}
