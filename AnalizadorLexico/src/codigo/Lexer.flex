package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\n,\r]+
%{
    public String lexem;
%}
%%
ent|
car|
flot|
const|
AND|
OR|
NOT|
CONCA|
Si|
Funcion|
Imprimir|
Escribir|
Camb {lexem=yytext(); return PalReservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Mas;}
"-" {return Menos;}
{L}({L}|{D})* {lexem=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexem=yytext(); return Numero;}
 . {return ERROR;}


