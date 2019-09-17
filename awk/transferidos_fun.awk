BEGIN { 
	FS = ";"; 
	OFS = FS;
	sem_uso = "NULO";
	
	i_afastamentos_demitido = 8
	data_fim = sem_uso
	req_beneficio = sem_uso
	data_calc_lei10710 = sem_uso
	data_cat = sem_uso
	numero_cat = sem_uso
	data_baixa = sem_uso
	transferencia = 1
	data_origem_transf = sem_uso
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	codi_emp = Campo("CODEMPFOL")
	codi_emp = soNumeros(codi_emp)
	codi_emp = FormataCampo("integer", codi_emp, 15)

	demissao = Campo("DTACONSITEMP")
	demissao = Trim(demissao)
	demissao = FormatDate(demissao, "-", "US")
	demissao = isDate(demissao)
	if( demissao != "NULO" )
		demissao = SomaDias(demissao, 1, "BR")
	else
		demissao = demissao

	i_empregados = Campo("MATEPGCTT")
	i_empregados = soNumeros(i_empregados)
	i_empregados = FormataCampo("integer", i_empregados, 15)
	
	if( demissao != "NULO"){
		if( JaImprimiuRegistro[codi_emp, i_empregados] == 0 ){
			print codi_emp, i_empregados, i_afastamentos_demitido, demissao, data_fim, req_beneficio, data_calc_lei10710, data_cat, numero_cat, data_baixa, transferencia,
				  data_origem_transf
				  
			JaImprimiuRegistro[codi_emp, i_empregados] = 1
		}
		else{
			print codi_emp, i_empregados, i_afastamentos_demitido, demissao, data_fim, req_beneficio, data_calc_lei10710, data_cat, numero_cat, data_baixa, transferencia,
				  data_origem_transf > "..\\temp\\demitidos_fun_repetidos.csv"
		}
	}
	else
		print codi_emp, i_empregados, i_afastamentos_demitido, demissao, data_fim, req_beneficio, data_calc_lei10710, data_cat, numero_cat, data_baixa, transferencia,
			  data_origem_transf > "..\\temp\\demitidos_fun_demissao_invalida.csv"
}