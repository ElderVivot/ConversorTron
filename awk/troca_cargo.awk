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
	
	data_troca = Campo("DTACTTOCUPRO")
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
	
	novo_codigo = Campo("CODOCUPRO")
	novo_codigo = soNumeros(novo_codigo)
	novo_codigo = RetornaCodiCargo(codi_emp, novo_codigo)
	
	if( i_empregados != "" && novo_codigo != 999 )
		print codi_emp, i_empregados, novo_codigo, data_troca
	else
		print codi_emp, i_empregados, novo_codigo, data_troca > "..\\temp\\troca_cargo_invalido.csv"
}
