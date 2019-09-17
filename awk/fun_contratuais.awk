BEGIN {
	FS = ";"; 
	OFS = FS;
	print "codi_emp", "i_empregados", "tipo", "codi_pessoa", "admissao", "vinculo", "i_sindicatos", "opta_fgts", "opcao_fgts", "oco_sefip", "data_base", "venc_ferias",
          "i_cargos", "i_depto", "i_ccustos", "i_jornada", "categoria", "forma_calculo", "salario", "contr_exper", "quantidade_dias_contrato_experiencia", "ini_praz_det",
		  "fim_praz_det", "quantidade_dias_prorrogacao_contrato_experiencia", "pro_praz_det", "tipo_cla_assc_dir_rec_res_ant", "conta_fgts", "i_servicos", "numero_livro_registro",
		  "numero_folha_livro_registro", "possui_vinc_out_emp", "numero_banco", "agencia", "nome_banco", "conta_corr", "digito_conta_pagamento", "tipo_conta"
		  
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	codi_emp = Campo("CODEMPFOL")
	codi_emp = soNumeros(codi_emp)
	
	cod_fun = Campo("MATEPGCTT")
	cod_fun = soNumeros(cod_fun)
	
	tipo = Campo("TIPPESEPG")
	tipo = Trim(tipo)
	
	cod_pes = Campo("CODPESEPG")
	cod_pes = soNumeros(cod_pes)
	
	admissao = Campo("DTAADMTRACTT")
	admissao = Trim(admissao)
	admissao = FormatDate(admissao, "-", "US")
	admissao = isDate(admissao)
	
	vinculo = Campo("CODVINEPT")
	vinculo = soNumeros(vinculo)
	vinculo = int(vinculo)
	vinculo = RetornaVinculoEmpregado(vinculo)
	
	vinculo_2 = Campo("CODCAT")
	vinculo_2 = soNumeros(vinculo_2)
	vinculo_2 = int(vinculo_2)
	if( vinculo_2 == 6 ) # EMPREGADO DOMESTICO
		vinculo = 52
	else if( vinculo_2 == 901 ) # ESTAGIARIO
		vinculo = 50
	else if( vinculo_2 == 4 ) # INTERMITENTE
		vinculo = 56
	else
		vinculo = vinculo
		
	quantidade_dias_contrato_experiencia = Campo("PRAEXPCTT")
	quantidade_dias_contrato_experiencia = soNumeros(quantidade_dias_contrato_experiencia)
	quantidade_dias_contrato_experiencia = FormataCampo("integer", quantidade_dias_contrato_experiencia, 15)
	quantidade_dias_contrato_experiencia = isNull(quantidade_dias_contrato_experiencia)
	
	quantidade_dias_prorrogacao_contrato_experiencia = Campo("PRAPROCTT")
	quantidade_dias_prorrogacao_contrato_experiencia = soNumeros(quantidade_dias_prorrogacao_contrato_experiencia)
	quantidade_dias_prorrogacao_contrato_experiencia = FormataCampo("integer", quantidade_dias_prorrogacao_contrato_experiencia, 15)
	quantidade_dias_prorrogacao_contrato_experiencia = isNull(quantidade_dias_prorrogacao_contrato_experiencia)
	
	if(quantidade_dias_contrato_experiencia != "NULO"){
		ini_praz_det = admissao
		
		quantidade_dias_contrato_experiencia_temp = int(quantidade_dias_contrato_experiencia) - 1 # SUBTRAI UM DIA PQ A ADMISSAO TAMBEM EH CONTADO COMO DIA TRABALHADO
		
		fim_praz_det = SomaDias(ini_praz_det, quantidade_dias_contrato_experiencia_temp)
		
		contr_exper = 1
		
		tipo_cla_assc_dir_rec_res_ant = 1
	}
	else{
		ini_praz_det = "NULO"
		fim_praz_det = "NULO"
		contr_exper = 0
		tipo_cla_assc_dir_rec_res_ant = "NULO"
	}
	
	if(quantidade_dias_prorrogacao_contrato_experiencia != "NULO" && quantidade_dias_contrato_experiencia != "NULO")
		pro_praz_det = SomaDias(fim_praz_det, quantidade_dias_prorrogacao_contrato_experiencia)
	else
		pro_praz_det = "NULO"
	
	sind = Campo("CODSIN")
	sind = soNumeros(sind)
	sind = FormataCampo("integer", sind, 15, 0)
	sind = sind + 5
	sind = RetornaCodiSindicato(sind)
	
	dt_fgts = Campo("DTAFGTCTT")
	dt_fgts = Trim(dt_fgts)
	dt_fgts = FormatDate(dt_fgts, "-", "US")
	dt_fgts = isDate(dt_fgts)
	
	if(dt_fgts != "NULO")
		opta_fgts = "S"
	else
		opta_fgts = "N"
		
	oco_sefip = Campo("CODOCO")
	oco_sefip = Trim(oco_sefip)
	
	possui_vinc_out_emp = IfElse( int( oco_sefip ) >= 5, "B", "N" )
	
	dt_vantagem = admissao
	
	dt_vecto_ferias = SomaAno(dt_vantagem, 1, "BR")
	
	# AVALIAR QUAIS CAMPOS PARA IMPLEMENTAR DADOS DA CONTA/AGENCIA PAGAMENTO OU DO PIS
	# AVALIAR SOBRE A FORMA DE PAGAMENTO: CAMPO FORPAGCTT
	
	i_cargos = Campo("I_CARGOS")
	i_cargos = soNumeros(i_cargos)
	i_cargos = RetornaCodiCargo(codi_emp, i_cargos)
	
	i_depto = Campo("I_DEPTO")
	i_depto = soNumeros(i_depto)
	i_depto = RetornaCodiDepto(codi_emp, i_depto)
	
	i_ccustos = Campo("I_CCUSTOS")
	i_ccustos = soNumeros(i_ccustos)
	i_ccustos = RetornaCodiCCusto(codi_emp, i_ccustos)
	
	i_jornada = Campo("I_JORNADA")
	i_jornada = soNumeros(i_jornada)
	i_jornada = RetornaCodiJornada(codi_emp, i_jornada)
	
	i_servicos = Campo("I_SERVICOS")
	i_servicos = soNumeros(i_servicos)
	i_servicos = int(i_servicos) + 1 # VAI SOMAR MAIS UM PQ NO ARQUIVO DE FOSERVICOS.AWK TAMBEM ESTA SOMANDO UM
	i_servicos = RetornaCodiServico(codi_emp, i_servicos)
	
	# TABELA TBLTIPPGT TEM A DESCRICAO E A TABELA TBLCTTTIPPGT QUE GUARDA A INFORMACAO
	# TODOS IGUAIS A DOMINIO: 1 --> MENSALISTA ; 2 --> QUINZENALISTA ; 3 --> SEMANALISTA
	categoria = Campo("CATEGORIA")
	categoria = soNumeros(categoria)
	
	forma_calculo = 1 # POR MES
	
	salario = Campo("SALARIO")
	salario = Trim(salario)
	salario = FormataCampo("double", salario, 30, 6)
	
	salario_professor = Campo("SALARIO_PROFESSOR")
	salario_professor = Trim(salario_professor)
	salario_professor = FormataCampo("double", salario_professor, 30, 6)
	
	conta_fgts = Campo("CODCONCORFGT")
	conta_fgts = soNumeros(conta_fgts)
	
	dv_conta_fgts = Campo("DIGVERCONCORFGT")
	dv_conta_fgts = Trim(dv_conta_fgts)
	if( dv_conta_fgts == "NULO" || dv_conta_fgts == "" || dv_conta_fgts == "N" )
		dv_conta_fgts = ""
	else
		dv_conta_fgts = "-" dv_conta_fgts
	
	if( int(conta_fgts) > 0 )
		conta_fgts_completa = conta_fgts dv_conta_fgts
	else
		conta_fgts_completa = conta_fgts
	
	if( int(salario) == 0 && int(salario_professor) > 0){
		salario_certo = salario_professor
		categoria = 5 # HORISTA
	}
	else{
		salario_certo = salario
		categoria = categoria
	}
	
	numero_livro_registro = Campo("REGCRACTT")
	numero_livro_registro = Trim(numero_livro_registro)
	numero_livro_registro = upperCase(numero_livro_registro)
	numero_livro_registro = isNull(numero_livro_registro)
	
	numero_folha_livro_registro = Campo("FOLREGCTT")
	numero_folha_livro_registro = Trim(numero_folha_livro_registro)
	numero_folha_livro_registro = upperCase(numero_folha_livro_registro)
	numero_folha_livro_registro = isNull(numero_folha_livro_registro)
	
	numero_banco = Campo("CODBCOSAL")
	numero_banco = Trim(numero_banco)
	
	agencia = Campo("CODAGESAL")
	agencia = Trim(agencia)
	
	nome_banco = Campo("NOME_BANCO")
	nome_banco = Trim(nome_banco)
	nome_banco = upperCase(nome_banco)
	nome_banco = isNull(nome_banco)
	nome_banco = IfElse( nome_banco == "NULO", "GERAL", nome_banco )
	
	conta_corr = Campo("CODCONCORSAL")
	conta_corr = Trim(conta_corr)
	conta_corr = isNull(conta_corr)
	
	digito_conta_pagamento = Campo("DIGVERCONCORSAL")
	digito_conta_pagamento = Trim(digito_conta_pagamento)
	digito_conta_pagamento = isNull(digito_conta_pagamento)
	
	tipo_conta = Campo("TIPO_CONTA")
	tipo_conta = Trim(tipo_conta)
	tipo_conta = upperCase(tipo_conta)
	tipo_conta = tpContaEmpregado(tipo_conta)
	
	if(codi_emp != "" && cod_fun != ""){
		print codi_emp, cod_fun, tipo, cod_pes, admissao, vinculo, sind, opta_fgts, dt_fgts, oco_sefip, dt_vantagem, dt_vecto_ferias, i_cargos, i_depto, i_ccustos, i_jornada,
              categoria, forma_calculo, salario_certo, contr_exper, quantidade_dias_contrato_experiencia, ini_praz_det, fim_praz_det, quantidade_dias_prorrogacao_contrato_experiencia,
			  pro_praz_det, tipo_cla_assc_dir_rec_res_ant, conta_fgts_completa, i_servicos, numero_livro_registro, numero_folha_livro_registro, possui_vinc_out_emp,
			  numero_banco, agencia, nome_banco, conta_corr, digito_conta_pagamento, tipo_conta
	}
	else{
		print codi_emp, cod_fun, tipo, cod_pes, admissao, vinculo, sind, opta_fgts, dt_fgts, oco_sefip, dt_vantagem, dt_vecto_ferias, i_cargos, i_depto, i_ccustos, i_jornada,
              categoria, forma_calculo, salario_certo, contr_exper, quantidade_dias_contrato_experiencia, ini_praz_det, fim_praz_det, quantidade_dias_prorrogacao_contrato_experiencia,
			  pro_praz_det, tipo_cla_assc_dir_rec_res_ant, conta_fgts_completa, i_servicos, numero_livro_registro, numero_folha_livro_registro,
			  possui_vinc_out_emp, numero_banco, agencia, nome_banco, conta_corr, digito_conta_pagamento, tipo_conta > "..\\temp\\fun_contratuais_invalido.csv"
	}
}