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
   
	i_ccustos = Campo("CODSEC")
    i_ccustos = soNumeros(i_ccustos)
	i_ccustos = FormataCampo("integer", i_ccustos, 15)
  
	nome = Campo("DSCSEC")
	nome = Trim(nome)
	nome = subsCharEspecial(nome)
	nome = upperCase(nome)
	
	# DADOS QUE NÃO SERÃO BUSCADOS DA TRON
	sem_uso = "NULO"
	origem_reg = 1
	usou_epi_por_iniviabilidade_apos_tentativa_implementacao_medidas_protecao_coletiva = 1
	foram_obersavadas_condicoes_funcionamento_uso_epi_conforme_especificacao_fabricante = 1
	foi_observado_prazo_validade_conforme_certificado_aprovacao_mte = 1
	foi_observada_periodicidade_troca_definida_programas_ambientais = 1
	foi_observada_higienizacao = 1
	tipo = sem_uso
	i_ccustos_sintetico = sem_uso
	mascara = sem_uso
	
	# OS COMANDOS ABAIXO VAI SERVIR PRA COLOCAR O CENTRO DE CUSTO GERAL PARA CADA EMPRESA
	i = codi_emp
	if( i == i_ant ){ # MESMA EMPRESA
		print codi_emp, i_ccustos, nome, origem_reg, usou_epi_por_iniviabilidade_apos_tentativa_implementacao_medidas_protecao_coletiva,
		      foram_obersavadas_condicoes_funcionamento_uso_epi_conforme_especificacao_fabricante, foi_observado_prazo_validade_conforme_certificado_aprovacao_mte,
			  foi_observada_periodicidade_troca_definida_programas_ambientais, foi_observada_higienizacao, tipo, i_ccustos_sintetico, mascara
	} else {
		# CARGO GERAL PARA AQUELES EMPREGADOS/CONTRIBUINTES QUE NÃO TIVEREM
		i_ccustos_geral = 9999
		nome_geral = "CENTRO DE CUSTO GERAL"
		
		print codi_emp, i_ccustos_geral, nome_geral, origem_reg, usou_epi_por_iniviabilidade_apos_tentativa_implementacao_medidas_protecao_coletiva,
		      foram_obersavadas_condicoes_funcionamento_uso_epi_conforme_especificacao_fabricante, foi_observado_prazo_validade_conforme_certificado_aprovacao_mte,
			  foi_observada_periodicidade_troca_definida_programas_ambientais, foi_observada_higienizacao, tipo, i_ccustos_sintetico, mascara
		
		# PRIMEIRO CENTRO DE CUSTO DO ARQUIVO CCUSTOS.TXT
		print codi_emp, i_ccustos, nome, origem_reg, usou_epi_por_iniviabilidade_apos_tentativa_implementacao_medidas_protecao_coletiva,
		      foram_obersavadas_condicoes_funcionamento_uso_epi_conforme_especificacao_fabricante, foi_observado_prazo_validade_conforme_certificado_aprovacao_mte,
			  foi_observada_periodicidade_troca_definida_programas_ambientais, foi_observada_higienizacao, tipo, i_ccustos_sintetico, mascara
	}
	i_ant = i
	
}
