BEGIN { 
	FS = ";"; 
	OFS = FS;
	
	sem_uso = "NULO";
	
	# DADOS QUE NAO SERAO BUSCADOS DA TRON PARA TABELA FOEMPREG_CONTRIB
	origem_reg = 1
	origem = 1
	
	# DADOS QUE NAO SERAO BUSCADOS DA TRON PARA TABELA FOHISTEMPRANT
	tipo_his = 4
	aquisitivo_fim = sem_uso
	fim_gozo = sem_uso
	tabela_troca = 16
	cod_anterior = sem_uso
	cod_novo = sem_uso
	data_gravacao = ""
	descricao = sem_uso
	sequencial = 0 # GERAR NO PROXIMO AWK
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

	competencia = Campo("MESANOINCMOVMEN")
	competencia = Trim(competencia)
	competencia = FormatDate(competencia, "-", "US")
	competencia = isDate(competencia)
	
	ano_referencia = substr(competencia, 7, 4)
	
	# ------------ DADOS DA TABELA FOHISTEMPRANT ------------
	data_his = competencia
	
	valor = Campo("VLRTOTEVEITEMOVMEN")
	valor = Trim(valor)
	valor = FormataCampo("double", valor, 13, 2)
	
	ini_gozo = competencia
	
	i_sindicatos = RetornaCodigoSindicato(codi_emp, i_empregados)
	
	indice_repetido = codi_emp "-" i_empregados "-" competencia

	if( int(valor) > 0 && i_empregados != "" && JaImprimiuRegistro[indice_repetido] == 0 ){ #somente contribuicoes sindicais que forem maior do que zero
		# FOEMPREG_CONTRSIND
		print codi_emp, i_empregados, competencia, origem_reg, ano_referencia, origem > "..\\temp\\foempreg_contrsind.csv"
		
		# FOHISTEMPRANT
		print codi_emp, i_empregados, tipo_his, data_his, aquisitivo_fim, ini_gozo, fim_gozo, valor, tabela_troca, cod_anterior, cod_novo, origem_reg, data_gravacao,
		      i_sindicatos, descricao > "..\\temp\\fohistemprant.csv"
			  
		JaImprimiuRegistro[indice_repetido] = 1
	}
	else{
		# FOEMPREG_CONTRIB
		print codi_emp, i_empregados, competencia, origem_reg, ano_referencia, origem > "..\\temp\\foempreg_contrsind_invalido.csv"
		
		# FOHISTEMPRANT
		print codi_emp, i_empregados, tipo_his, data_his, aquisitivo_fim, ini_gozo, fim_gozo, valor, tabela_troca, cod_anterior, cod_novo, origem_reg, data_gravacao,
		      i_sindicatos, descricao, sequencial > "..\\temp\\fohistemprant_invalido.csv"
	}
	
}