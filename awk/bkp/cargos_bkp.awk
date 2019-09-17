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
	codi_emp = FormataCampo("integer", codi_emp, 15)

	i_cargos = Campo("CODOCUPRO")
	i_cargos = soNumeros(i_cargos)
	i_cargos = FormataCampo("integer", i_cargos, 15)

	nome = Campo("DSCOCUPRO")
	nome = Trim(nome)
	nome = subsCharEspecial(nome)
	nome = upperCase(nome)

	cbo2002 = Campo("CODCBO")
	cbo2002 = soNumeros(cbo2002)
	
	cod_esocial = i_cargos
	
	# DADOS QUE NÃO SERÃO BUSCADOS DA TRON
	sem_uso = "NULO"
	cbo = sem_uso
	origem_reg = 1
	atividade = sem_uso
	ppp_campo_1 = 1
	ppp_campo_2 = 1
	ppp_campo_3 = 1
	ppp_campo_4 = 1
	ppp_campo_5 = 1
	ppp_observacoes = sem_uso
	gerencia_supervisao = 0
	data_inicio = sem_uso # VAI SER BUSCADO NO ARQUIVO DATA_INICIO.AWK
	situacao = 1
	data_inativacao = sem_uso
	
	# OS COMANDOS ABAIXO VAI SERVIR PRA COLOCAR O CARGO GERAL PARA CADA EMPRESA
	i = codi_emp
	if( i == i_ant ){ # MESMA EMPRESA
		print codi_emp, i_cargos, nome, cbo, cbo2002, origem_reg, atividade, ppp_campo_1, ppp_campo_2, ppp_campo_3, ppp_campo_4, ppp_campo_5, ppp_observacoes,
              gerencia_supervisao, data_inicio, situacao, data_inativacao, cod_esocial
	} else {
		# CARGO GERAL PARA AQUELES EMPREGADOS/CONTRIBUINTES QUE NÃO TIVEREM
		i_cargos_geral = 9999
		nome_geral = "CARGO GERAL"
		cbo2002_geral = sem_uso
		cod_esocial_geral = i_cargos_geral
		
		print codi_emp, i_cargos_geral, nome_geral, cbo, cbo2002_geral, origem_reg, atividade, ppp_campo_1, ppp_campo_2, ppp_campo_3, ppp_campo_4, ppp_campo_5, ppp_observacoes,
			  gerencia_supervisao, data_inicio, situacao, data_inativacao, cod_esocial_geral
		
		# PRIMEIRO CARGO DO ARQUIVO CARGOS.TXT
		print codi_emp, i_cargos, nome, cbo, cbo2002, origem_reg, atividade, ppp_campo_1, ppp_campo_2, ppp_campo_3, ppp_campo_4, ppp_campo_5, ppp_observacoes,
              gerencia_supervisao, data_inicio, situacao, data_inativacao, cod_esocial
	}
	i_ant = i
	
}