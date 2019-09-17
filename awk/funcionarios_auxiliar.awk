BEGIN {
	FS = ";"; 
	OFS = FS;
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	codi_emp = Campo("CODEMPFOL")
	codi_emp = soNumeros(codi_emp)
	
	i_empregados = Campo("MATEPGCTT")
	i_empregados = soNumeros(i_empregados)
	
	i_jornada = Campo("I_JORNADA")
	i_jornada = soNumeros(i_jornada)
	
	print codi_emp, i_empregados, i_jornada
	
}