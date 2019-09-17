BEGIN {
	FS = ";";
	OFS = FS;
	novo_codigo = 0;
}
{
	codi_emp = $2
	
	nome_emp = $1
	
	novo_codigo++
	
	print codi_emp, nome_emp, "", novo_codigo
		
}