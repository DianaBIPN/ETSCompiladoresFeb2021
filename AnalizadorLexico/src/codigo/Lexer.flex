package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexem;
%}
%%
ent {lexem=yytext(); return ent;}
car {lexem=yytext(); return car;}
flot {lexem=yytext(); return flot;}
consta {lexem=yytext(); return consta;}
AND {lexem=yytext(); return AND;}
OR {lexem=yytext(); return OR;}
NOT {lexem=yytext(); return NOT;}
CONCA {lexem=yytext(); return CONCA;}
Si {lexem=yytext(); return Si;}
Funcion {lexem=yytext(); return Funcion;}
Imprimir {lexem=yytext(); return Imprimir;}
Escribir {lexem=yytext(); return Escribir;}
Camb {lexem=yytext(); return Cambiar;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {return Salto;}
"=" {lexem=yytext(); return Igual;}
"+" {lexem=yytext(); return Mas;}
"-" {lexem=yytext(); return Menos;}
"(" {lexem=yytext(); return Parentesis_ap;}
")" {lexem=yytext(); return Parentesis_c;}
"{" {lexem=yytext(); return Llave_ap;}
"}" {lexem=yytext(); return Llave_c;}
"main" {lexem=yytext(); return Main;}
";" {lexem=yytext(); return Punto_c;}
{L}({L}|{D})* {lexem=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexem=yytext(); return Numero;}
 . {return ERROR;}


