BEGIN{
	FS = ";";
	OFS = FS;
	data_nula = "01/01/1900";
	sem_uso = "NULO";
	
	# DADOS QUE NAO SERAO BUSCADOS DA TRON
	i_ferias_gozo = 0 # VAI SER IMPLEMENTADO NO PROXIMO AWK
	paga_ad13 = "N"
	medias_manual = "N"
	dias_faltas = 0
	baixa_prov_ferias = 0
	baixa_prov_adicferias = 0
	baixa_prov_inss = 0
	baixa_prov_fgts = 0
	baixa_prov_pis = 0
	i_pagto = sem_uso
	descontar_faltas = "N"
	i_ferias_coletivas = sem_uso
	transferido = 0
	tipo = 4
	origem_reg = 1
	descontar_faltas_noturnas = "N"
	descontar_faltas_suspensao = "N"
	descontar_faltas_parciais = "N"
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
	
	data_aquisitivo_ferias = Campo("DTAINIAQUPRGFRS")
	data_aquisitivo_ferias = Trim(data_aquisitivo_ferias)
	data_aquisitivo_ferias = FormatDate(data_aquisitivo_ferias, "-", "US")
	data_aquisitivo_ferias = isDate(data_aquisitivo_ferias)
	
	admissao = RetornaDataAdmissao(codi_emp, i_empregados)
	
	ano_aquisitivo_ferias = substr(data_aquisitivo_ferias, 7, 4)
	
	ano_admissao = substr(admissao, 7, 4)
	
	# PEGA O ANO DE AQUISITIVOS - ANO ADMISSAO E SOMA 1
	i_ferias_aquisitivos = int(ano_aquisitivo_ferias) - int(ano_admissao) + 1
	
	gozo_inicio = Campo("DTAINIGOZPRGFRS")
	gozo_inicio = Trim(gozo_inicio)
	gozo_inicio = FormatDate(gozo_inicio, "-", "US")
	gozo_inicio = isDate(gozo_inicio)
	
	if( gozo_inicio != "NULO" ){
		gozo_inicio_dn = diferencaEmDiasEntreData( gozo_inicio, data_nula )
		gozo_inicio_dn = FormataCampo("double", gozo_inicio_dn, 15, 2)
	}
	
	gozo_fim = Campo("DTAFINGOZPRGFRS")
	gozo_fim = Trim(gozo_fim)
	gozo_fim = FormatDate(gozo_fim, "-", "US")
	gozo_fim = isDate(gozo_fim)
	
	if( gozo_fim != "NULO" )
		gozo_fim_dn = diferencaEmDiasEntreData( gozo_fim, data_nula ) ".99"
	
	inicio_aquisitivo = Campo("DTAINIAQUPRGFRS")
	inicio_aquisitivo = Trim(inicio_aquisitivo)
	inicio_aquisitivo = FormatDate(inicio_aquisitivo, "-", "US")
	inicio_aquisitivo = isDate(inicio_aquisitivo)
	
	fim_aquisitivo = Campo("DTAFINAQUITEPRGFRS")
	fim_aquisitivo = Trim(fim_aquisitivo)
	fim_aquisitivo = FormatDate(fim_aquisitivo, "-", "US")
	fim_aquisitivo = isDate(fim_aquisitivo)
	if(fim_aquisitivo == "NULO")
		fim_aquisitivo = SomaAno(inicio_aquisitivo, 1, "BR")
	else
		fim_aquisitivo = fim_aquisitivo
	
	data_pagto = gozo_inicio
	
	abono_inicio = Campo("DTAINIABOPRGFRS")
	abono_inicio = Trim(abono_inicio)
	abono_inicio = FormatDate(abono_inicio, "-", "US")
	abono_inicio = isDate(abono_inicio)
	if(abono_inicio == "NULO"){
		abono_inicio = data_nula
		abono_inicio_dn = "0.00"
		abono_paga = "N"
	}
	else{
		abono_inicio = abono_inicio
		
		abono_inicio_dn = diferencaEmDiasEntreData( abono_inicio, data_nula )
		abono_inicio_dn = FormataCampo("double", abono_inicio_dn, 15, 2)
		
		abono_paga = "S"
	}
	
	abono_fim = Campo("DTAFINABOPRGFRS")
	abono_fim = Trim(abono_fim)
	abono_fim = FormatDate(abono_fim, "-", "US")
	abono_fim = isDate(abono_fim)
	if(abono_fim == "NULO"){
		abono_fim = data_nula
		abono_fim_dn = "0.00"
	}
	else{
		abono_fim = abono_fim
		
		abono_fim_dn = diferencaEmDiasEntreData( abono_fim, data_nula ) ".99"
	}
	
	if( i_empregados != "" && gozo_inicio != "NULO" && gozo_fim != "NULO" && int(i_ferias_aquisitivos) > 0 ){
		print codi_emp, i_empregados, i_ferias_gozo, i_ferias_aquisitivos, gozo_inicio, gozo_fim, abono_paga, abono_inicio, abono_fim, data_pagto, paga_ad13, medias_manual,
     	      dias_faltas, baixa_prov_ferias, baixa_prov_adicferias, baixa_prov_inss, baixa_prov_fgts, baixa_prov_pis, i_pagto, descontar_faltas, i_ferias_coletivas,
			  transferido, tipo, origem_reg, gozo_inicio_dn, gozo_fim_dn, abono_inicio_dn, abono_fim_dn, inicio_aquisitivo, fim_aquisitivo, descontar_faltas_noturnas, 
			  descontar_faltas_suspensao, descontar_faltas_parciais
	}
	else{
		print codi_emp, i_empregados, i_ferias_gozo, i_ferias_aquisitivos, gozo_inicio, gozo_fim, abono_paga, abono_inicio, abono_fim, data_pagto, paga_ad13, medias_manual,
     	      dias_faltas, baixa_prov_ferias, baixa_prov_adicferias, baixa_prov_inss, baixa_prov_fgts, baixa_prov_pis, i_pagto, descontar_faltas, i_ferias_coletivas,
			  transferido, tipo, origem_reg, gozo_inicio_dn, gozo_fim_dn, abono_inicio_dn, abono_fim_dn, inicio_aquisitivo, fim_aquisitivo, descontar_faltas_noturnas, 
			  descontar_faltas_suspensao, descontar_faltas_parciais > "..\\temp\\foferias_gozo_invalido.csv"
	}
}
