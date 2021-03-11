%{
	int_num_lineas = 0, num_caracteres = 0;
%}

%%

\n	num_lineas++; num_caracteres++;
.	num_caracteres++;

%%

int yywrap()
{
	return 1;
}

main()
{
	yyin = fopen("entrada.txt","r");
	while (yylex());
	printf("No. lineas = %d, No. caracteres = %d\n", num_lines, num_caracteres);
}
