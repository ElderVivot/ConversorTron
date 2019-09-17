BEGIN {
	FS = ";"; 
	OFS = FS;
	sem_uso = "NULO";
	i_lote = 0
	
	# FOESOCIAL_LOTES
	status = 4
	versao = "conversao"
	lote_exclusao = 0
	
	# FOESOCIAL_LOTES_ENVIO
	sequencial = 1
	xml_envio_reg = sem_uso
	i_resposta_envio= sem_uso
	descricao_resposta_envio = sem_uso
	xml_retorno_envio = sem_uso
	data_hora_envio = sem_uso
	i_resposta_consulta = sem_uso
	descricao_resposta_consulta = sem_uso
	horario_consulta = sem_uso
	xml_retorno_consulta = sem_uso
	
	# FOESOCIAL_DADOS_EVENTOS
	tipo_envio = 1
	i_resposta = 201
	descricao_resposta = "Sucesso."
	validado = 1
	aguardando_ajuste = 0
	data_hora_conclusao = sem_uso
	nome_arquivo = sem_uso
	data_alteracao = sem_uso
	i_evento_esocial_excluido = sem_uso
	numero_recibo_excluido = sem_uso
	codi_emp_evento_retificacao = sem_uso
	i_dados_evento_evento_retificado = sem_uso
	competencia_calculo = sem_uso
	gerar_remuneracao_13_salario = 0
	i_responsavel = sem_uso
	existe_movimentacao_periodo = 1
	i_servicos = sem_uso
	tipo_validacao = 1
	xml_alterado = 0
	mostrar_painel_esocial = 1
	nis_empregado = sem_uso
	
	i_evento_esocial = 0
}
{
	if(FNR == 1){
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	#if( index( "<alteracao>" ) )
	
	codi_emp = Campo("CODEMP")
	codi_emp = soNumeros(codi_emp)
	
	numero_recibo = Campo("NUMRCBESO")
	numero_recibo = Trim(numero_recibo)
	
	i_evento_esocial = Campo("REGMSGCOMESO")
	i_evento_esocial = soNumeros(i_evento_esocial)
	
	xml_envio = Campo("XMLMSGCOMESO")
	xml_envio = Trim(xml_envio)
	
	id_esocial = selecionaTAG( xml_envio, " Id=\"", "\"><ideEvento>" )
	id_esocial = Trim(id_esocial)
	
	vigencia = ""
	
	codi_emp_matriz = ""
	
	data_hora_conclusao = getDate()
	
	codigo_esocial = ""
	
	cnpj_servico = ""
	
	horario_entrada = ""
	
	horario_saida = ""
	
	if( i_evento_esocial == "1000" ){
		
		tabela_dados = "GEEMPRE"
		
		codigo_esocial = codi_emp
		
		chave_primaria = codi_emp
	
		chave_tabela_dados = "codi_emp = " codi_emp " AND id_concorrente = " chave_primaria
	}
	else if( i_evento_esocial == "1005" ){
		
		tag_inclusao = selecionaTAG( xml_envio, "<inclusao>", "</inclusao>" )
		
		cnpj_servico = selecionaTAG( tag_inclusao, "<nrInsc>", "</nrInsc>" )
		
		tabela_dados = "FOVIGENCIAS_SERVICO"
		
		chave_primaria = Campo("I_SERVICOS_1005")
		chave_primaria = Trim(chave_primaria)
		chave_primaria = IfElse( chave_primaria == "NULO", 1, chave_primaria )
		
		vigencia = selecionaTAG( tag_inclusao, "<iniValid>", "</iniValid>" )
		
		codigo_esocial = "00001"
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND id_concorrente = " chave_primaria " AND cnpj_servico = " cnpj_servico " AND vigencia = DATE('" vigencia "')"
	}
	else if( i_evento_esocial == "1010" ){
		
		tabela_dados = "FOEVENTOS_CONTROLE_ENVIO_ESOCIAL"
		
		codigo_esocial = selecionaTAG( xml_envio, "<codRubr>", "</codRubr>" )
		
		chave_primaria = codigo_esocial
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND id_concorrente = " chave_primaria
	}
	else if( i_evento_esocial == "1020" ){
		
		tabela_dados = "FOVIGENCIAS_SERVICO"
		
		codigo_esocial = selecionaTAG( xml_envio, "<codLotacao>", "</codLotacao>" )
		
		cnpj_servico = substr( codigo_esocial, 1, length( codigo_esocial ) - 1 )
		
		chave_primaria = Campo("I_SERVICOS_1020")
		chave_primaria = Trim(chave_primaria)
		chave_primaria = IfElse( chave_primaria == "NULO", 1, chave_primaria )
		
		vigencia = selecionaTAG( tag_inclusao, "<iniValid>", "</iniValid>" )
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND id_concorrente = " chave_primaria " AND vigencia = DATE('" vigencia "')"
	}
	else if( i_evento_esocial == "1030" ){
		
		tabela_dados = "FOCARGOS"
		
		chave_primaria = Campo("I_CARGOS")
		chave_primaria = Trim(chave_primaria)
		chave_primaria = IfElse( chave_primaria == "NULO", 1, chave_primaria )
		
		codigo_esocial = selecionaTAG( xml_envio, "<codCargo>", "</codCargo>" )
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND id_concorrente = " chave_primaria
	}
	else if( i_evento_esocial == "1050" ){
		
		tabela_dados = "FOHORARIOS"
		
		chave_primaria = Campo("I_HORARIO")
		chave_primaria = Trim(chave_primaria)
		chave_primaria = IfElse( chave_primaria == "NULO", 1, chave_primaria )
		
		tag_horario = selecionaTAG( xml_envio, "<dadosHorContratual>", "</dadosHorContratual>" )
		
		horario_entrada = selecionaTAG( tag_horario, "<hrEntr>", "</hrEntr>" )
		horario_entrada = substr(horario_entrada, 1, 2) ":" substr(horario_entrada, 3, 2)
		
		horario_saida = selecionaTAG( tag_horario, "<hrSaida>", "</hrSaida>" )
		horario_saida = substr(horario_saida, 1, 2) ":" substr(horario_saida, 3, 2)
		
		codigo_esocial = selecionaTAG( xml_envio, "<codHorContrat>", "</codHorContrat>" )
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND id_concorrente = " chave_primaria
	}
	else if( i_evento_esocial == "2200" ){
		
		tabela_dados = "FOEMPREGADOS"
		
		codigo_esocial = selecionaTAG( xml_envio, "<matricula>", "</matricula>" )
		
		chave_primaria = Campo("MATEPGCTT")
		chave_primaria = Trim(chave_primaria)
		chave_primaria = IfElse( chave_primaria == "NULO", 1, chave_primaria )
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND id_concorrente = " chave_primaria
	}
	else if( i_evento_esocial == "2300" ){
		
		tabela_dados = "FOEMPREGADOS"
	
		codigo_esocial = selecionaTAG( xml_envio, "<cpfTrab>", "</cpfTrab>" )
		
		chave_primaria = Campo("MATEPGCTT")
		chave_primaria = Trim(chave_primaria)
		chave_primaria = isNull(chave_primaria)
		if( chave_primaria == "NULO" ){
			i_contribuintes = Campo("CODPESCBTIND")
			i_contribuintes = Trim(i_contribuintes)
			
			tipo_contribuinte = Campo("TIPPESCBTIND")
			tipo_contribuinte = Trim(tipo_contribuinte)
			
			chave_primaria = i_contribuintes "-" tipo_contribuinte
		}
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND id_concorrente = " chave_primaria
	}
	#else if( i_evento_esocial == "2299" ) # DESLIGAMENTO - AVALIAR MELHOR
	#	next
	else if( i_evento_esocial == "2230" ) # AFASTAMENTO TEMPORARIO
		next
	else if( i_evento_esocial == "2205" ) # ALTERACAO DADOS CADASTRAIS DO EMPREGADO
		next
	else if( i_evento_esocial == "2206" ) # ALTERACAO DADOS CONTRATUAIS DO EMPREGADO
		next
	else if( i_evento_esocial == "2250" ) # AVISO PREVIO
		next
	else if( i_evento_esocial == "1200" ) # REMUNERACAO TRABALHADOR
		next
	else if( i_evento_esocial == "1210" ) # PAGAMENTO TRABALHADOR
		next
	else if( i_evento_esocial == "3000" ) # EXCLUSAO
		next
	else if( i_evento_esocial == "1299" ) # FECHAMENTO
		next
	else if( i_evento_esocial == "2190" ) # REGISTRO PRELIMINAR DE FUNCIONARIO
		next
	else{
		print $0 > "..\\prontos\\_novos_eventos_esocial_avaliar.csv"
	}
	
	if(codi_emp == codi_emp_ant){
		i_lote++
	} else {
		i_lote = 1
	}
	
	i_dados_evento = i_lote
	
	# ARQUIVO PRA UTILIZAR COMO TRATAMENTO
	print codi_emp, i_evento_esocial, codigo_esocial, chave_primaria, numero_recibo, id_esocial, i_lote, cnpj_servico, horario_entrada, horario_saida
	
	# FOESOCIAL_LOTES
	print codi_emp, i_lote, status, i_evento_esocial, versao, lote_exclusao > "..\\temp\\foesocial_lotes.csv"
	
	# FOESOCIAL_LOTES_ENVIO
	print codi_emp, i_lote, sequencial, xml_envio, i_resposta, descricao_resposta, xml_retorno_envio, data_hora_conclusao, numero_recibo, i_resposta_consulta,
	      descricao_resposta_consulta, horario_consulta, xml_retorno_consulta > "..\\temp\\foesocial_lotes_envios.csv"
	
	# FOESOCIAL_DADOS_EVENTOS
	print codi_emp, i_dados_evento, i_lote, codigo_esocial, i_evento_esocial, tipo_envio, tabela_dados, chave_tabela_dados, id_esocial, xml_envio, numero_recibo, i_resposta,
          descricao_resposta, validado, aguardando_ajuste, data_hora_conclusao, nome_arquivo, data_alteracao, i_evento_esocial_excluido, numero_recibo_excluido,
		  codi_emp_evento_retificacao, i_dados_evento_evento_retificado, competencia_calculo, gerar_remuneracao_13_salario, i_responsavel, existe_movimentacao_periodo,
		  i_servicos, tipo_validacao, xml_alterado, mostrar_painel_esocial, nis_empregado > "..\\temp\\foesocial_dados_eventos.csv"
		  
	codi_emp_ant = codi_emp
}