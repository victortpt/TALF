%{
	int num_minusculas = 0, num_mayusculas = 0, num_mixtas = 0, num_enteros = 0, num_reales = 0, suma_enteros = 0;
	double suma_reales = 0.0;
%}

%%

\n	num_minusculas++; num_mayusculas++; num_mixtas++;
.	num_enteros++; num_reales++; suma_enteros += suma_enteros; suma_reales += suma_reales;

%%

[A-Z]+		num_mayusculas++;  printf("%s\n", yytext); /* Todas las mayusculas*/
[a-z]+		num_minusculas++; /* Todas las minúsculas*/
[A-Za-z]+	num_mixtas++; /* Todas las letras mixtas, mayusculas y minusculas */
[0.9]+		num_enteros; /* Todos los numeros enteros */
[0-9]+(\.[0-9]+)?([Ee][+-]?[0-9]+)?	num_reales++; suma_reales += atof(yytext); printf("Real:" %s\n", yytext);

.|\n	;


%%

int yywrap()
{
	return 1;
}

int main(int argc, char *argv[])
{
	if (argc<2) {
		printf("ERROR: necesario nombre de archivo de entrada");
		exit(0);
	}
	yyin = fopen(argc[1], "r");
	yylex();
	while (yylex());
	printf("No. mayusculas = %d, No.minusculas = %d\n", num_mayusculas, num_minusculas);
}

