BEGIN {
	FS = ";";
	OFS = FS;
}
{
	codi_emp = $1
	
	nome_emp = $2
	
	print nome_emp, codi_emp
		
}