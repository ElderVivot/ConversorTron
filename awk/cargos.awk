BEGIN { 
	FS = ";"; 
	OFS = FS;
	sem_uso = "NULO";
	
	# DADOS QUE NÃO SERÃO BUSCADOS DA TRON
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
	
	cod_esocial = ""
	cod_esocial = RetornaCodigoEsocial(codi_emp, "1030", i_cargos )
	cod_esocial = IfElse( cod_esocial == "NULO", i_cargos, cod_esocial ) 

	nome = Campo("DSCOCUPRO")
	nome = Trim(nome)
	nome = subsCharEspecial(nome)
	nome = upperCase(nome)
	
	atividade = Campo("DSCATVEXEOCUPRO")
	atividade = Trim(atividade)
	#atividade = subsCharEspecial(atividade)
	#atividade = upperCase(atividade)

	cbo2002 = Campo("CODCBO")
	cbo2002 = soNumeros(cbo2002)
	
	i_dados_evento_esocial = ""
	i_dados_evento_esocial = RetornaILote(codi_emp, "1030", i_cargos )

	i_lote_esocial = i_dados_evento_esocial
	
	status_esocial = IfElse( i_lote_esocial == "NULO", "NULO", 3 )
	
	enviar_esocial = IfElse( i_lote_esocial == "NULO", 1, 0 )
	
	inclusao_validada_esocial = IfElse( i_lote_esocial == "NULO", 0, 1 )
	
	gerar_retificacao_esocial = 0
	
	print codi_emp, i_cargos, nome, cbo, cbo2002, origem_reg, atividade, ppp_campo_1, ppp_campo_2, ppp_campo_3, ppp_campo_4, ppp_campo_5, ppp_observacoes,
		  gerencia_supervisao, data_inicio, situacao, data_inativacao, cod_esocial, i_dados_evento_esocial, i_lote_esocial, status_esocial, enviar_esocial, 
		  inclusao_validada_esocial, gerar_retificacao_esocial

}