%{
#include <stdio.h>
extern int yylex(void);
extern char *yytext;
void yyerror(char *s);
extern FILE *yyin;

// Declaración externa de yylineno
extern int yylineno;

// Función para aumentar el número de línea al encontrar un salto de línea
void increase_line_number() {
    int i;
    for (i = 0; yytext[i] != '\0'; i++) {
        if (yytext[i] == '\n') {
            yylineno++;
        }
    }
}
%}

%token END ENT TEXT DEC COND COM INIT FR APC CPC ASI PYC VEO ACO CCO MEN MEI MAY MAI IGU NIG Y O INC MS SIS NOS SUM MUL RES DIV TRY CATCH ITK

%%

lines       :  
            | lines variable
            | lines ciclo END
            | lines condicional END
            | lines metodo END
            | lines callMetodo END
            | lines exception END
            | lines operacion END

ciclo       : FR APC bucle PYC condicion PYC incremento CPC ACO lines CCO
            | MS APC condicion CPC ACO lines CCO

condicional : SIS APC condicion CPC ACO lines CCO 
            | SIS APC condicion CPC ACO lines CCO NOS ACO lines CCO

metodo      : tdato ITK APC parametros CPC ACO lines VEO ITK CCO
            | INIT ITK APC parametros CPC ACO lines CCO
            | tdato ITK APC CPC ACO lines VEO ITK CCO
            | INIT ITK APC CPC ACO lines CCO
        
callMetodo : ITK APC idParametros CPC
            | ITK APC CPC    

parametros  : parametro 
            | parametros COM parametro

parametro   : tdato ITK

idParametros : idParametro
             | idParametros COM idParametro

idParametro : ITK

variable    : tdato ITK END 
            | tdato ITK ASI ITK END 

bucle       : tdato ITK ASI ITK 

exception   : TRY ACO lines CCO CATCH ACO lines CCO 

operacion   : ITK operadorA ITK 

incremento  : ITK INC

condicion   : ITK operadorL ITK
            | ITK operadorL ITK conector ITK operadorL ITK

operadorA   : SUM    
            | RES
            | MUL
            | DIV

tdato       : ENT 
            | TEXT
            | DEC
            | COND

operadorL   : MEN
            | MEI
            | MAY
            | MAI
            | IGU
            | NIG

conector    : Y 
            | O

%%

void yyerror(char *s) {
    fprintf(stderr, "Error Sintáctico: %s en la línea %d\n", s, yylineno);
}

int main(int argc, char **argv){
    printf("Inicio del programa: \n");
    if(argc > 1)
        yyin = fopen(argv[1], "rt");
    else
        yyin = stdin;
    yyparse();
    return 0;
}
