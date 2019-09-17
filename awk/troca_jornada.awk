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
	i_empregados = RetornaInformacaoFun(codi_emp, i_empregados)
	
	data_troca = Campo("DTAHORTRBCTT")
	data_troca = Trim(data_troca)
	data_troca = FormatDate(data_troca, "-", "US")
	data_troca = isDate(data_troca)
	
	admissao = RetornaDataAdmissao(codi_emp, i_empregados)
	
	i = codi_emp "-" i_empregados
	
	if( i != i_ant && data_troca != admissao )
		data_troca = admissao
	else
		data_troca = data_troca
	
	i_ant = i
	
	i_jornada = Campo("CODHORTRB")
	i_jornada = soNumeros(i_jornada)
	i_jornada = RetornaCodiJornada(codi_emp, i_jornada)
	
	if(i_empregados != "" && i_jornada != 999 && data_troca != "NULO")
		print codi_emp, i_empregados, i_jornada, data_troca
	else
		print codi_emp, i_empregados, i_jornada, data_troca > "..\\temp\\troca_jornada_invalido.csv"
}
