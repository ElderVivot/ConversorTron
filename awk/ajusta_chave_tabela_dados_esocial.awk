BEGIN {
	FS = ";";
	OFS = FS;
	
	# --------- CARGOS ------------
	ArquivoCargos = "..\\prontos\\3_focargos.csv"
	while((getline < ArquivoCargos) > 0){
		codi_emp_cargos = $1
		i_cargos = $2
		i_dados_evento_esocial_cargos = $19
		
		ICargos[codi_emp_cargos, i_dados_evento_esocial_cargos] = i_cargos
	} close(ArquivoCargos)
	
	# --------- HORARIOS ------------
	ArquivoHorarios = "..\\prontos\\3_fohorarios.csv"
	while((getline < ArquivoHorarios) > 0){
		codi_emp_horario = $1
		i_horario = $2
		i_dados_evento_esocial_horarios = $18
		
		IHorario[codi_emp_horario, i_dados_evento_esocial_horarios] = i_horario
	} close(ArquivoHorarios)
	
	# --------- EMPREGADOS ------------
	ArquivoEmpregados = "..\\prontos\\7_foempregados_dados_eventos_esocial.csv"
	while((getline < ArquivoEmpregados) > 0){
		codi_emp_empregados = $1
		i_empregados = $2
		i_dados_evento_esocial_empregados = $3
		
		IEmpregados[codi_emp_empregados, i_dados_evento_esocial_empregados] = i_empregados
		
	} close(ArquivoEmpregados)
	
	# --------- SERVICOS ------------
	ArquivoVigServico = "..\\prontos\\4_fovigencias_servico.csv"
	while((getline < ArquivoVigServico) > 0){
		codi_emp_servico = $1
		i_servicos = $2
		
		vigencia_servico = $3
		vigencia_servico = substr( vigencia_servico, 7, 4 ) "-" substr( vigencia_servico, 4, 2 ) "-" substr( vigencia_servico, 1, 2 )
		
		i_dados_evento_esocial_servico_s1005 = $61
		i_dados_evento_esocial_servico_s1020 = $67
		
		IServicos1005[codi_emp_servico, i_dados_evento_esocial_servico_s1005] = i_servicos
		VigenciaServico1005[codi_emp_servico, i_dados_evento_esocial_servico_s1005] = vigencia_servico
		
		IServicos1020[codi_emp_servico, i_dados_evento_esocial_servico_s1020] = i_servicos
		VigenciaServico1020[codi_emp_servico, i_dados_evento_esocial_servico_s1020] = vigencia_servico
	} close(ArquivoVigServico)
}
{
	codi_emp = ""
	codi_emp = $1
	
	i_dados_eventos = ""
	i_dados_eventos = $2
	
	i_evento_esocial = ""
	i_evento_esocial = $5
	
	chave_tabela_dados = ""
	
	tabela_dados = ""
	tabela_dados = $7
	
	if( i_evento_esocial == "1000" ){
		chave_tabela_dados = "codi_emp = " codi_emp
		$8 = chave_tabela_dados
		
		# CODIGO E-SOCIAL DO S1000 É A PRÓPRIA EMPRESA
		$4 = codi_emp
	}
	else if( i_evento_esocial == "1005" ){
		
		# DEVIDO AO ERRO NA VERSAO 101A12 ESTE REGISTRO SERA PULADO
		next
		
		# CASO NAO HAVA VINCULO COM SERVICO DENTRO DA DOMINIO ENTAO NAO IMPORTA O E-SOCIAL, O MESMO VAI VALER PARA OS DEMAIS ABAIXO
		if( IServicos1005[codi_emp, i_dados_eventos] == "" )
			next
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND i_servicos = " IServicos1005[codi_emp, i_dados_eventos] " AND vigencia = DATE('" VigenciaServico1005[codi_emp, i_dados_eventos] "')"
		$8 = chave_tabela_dados
	}
	else if( i_evento_esocial == "1020" ){
		
		# DEVIDO AO ERRO NA VERSAO 101A12 ESTE REGISTRO SERA PULADO
		next
		
		if( IServicos1020[codi_emp, i_dados_eventos] == "" )
			next
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND i_servicos = " IServicos1020[codi_emp, i_dados_eventos] " AND vigencia = DATE('" VigenciaServico1020[codi_emp, i_dados_eventos] "')"
		$8 = chave_tabela_dados
	}
	else if( i_evento_esocial == "1030" ){
		
		if( ICargos[codi_emp, i_dados_eventos] == "" )
			next
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND i_cargos = " ICargos[codi_emp, i_dados_eventos]
		$8 = chave_tabela_dados
	}
	else if( i_evento_esocial == "1050" ){
		
		if( IHorario[codi_emp, i_dados_eventos] == "" )
			next
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND i_horario = " IHorario[codi_emp, i_dados_eventos]
		$8 = chave_tabela_dados
	}
	else if( i_evento_esocial == "2200" ){
		
		if( IEmpregados[codi_emp, i_dados_eventos] == "" )
			next
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND i_empregados = " IEmpregados[codi_emp, i_dados_eventos]
		$8 = chave_tabela_dados
		
	}
	else if( i_evento_esocial == "2300" ){
		
		if( IEmpregados[codi_emp, i_dados_eventos] == "" )
			next
		
		chave_tabela_dados = "codi_emp = " codi_emp " AND i_empregados = " IEmpregados[codi_emp, i_dados_eventos]
		$8 = chave_tabela_dados
	}
	else
		next
	
	print $0
	
	print codi_emp, i_dados_eventos, i_dados_eventos, tabela_dados, chave_tabela_dados > "..\\prontos\\2_foesocial_dados_eventos_tabelas_relacionadas.csv"
	
	VEsocialExiste[codi_emp, i_dados_eventos] = 1
}
END{
	
	# --------- FOESOCIAL_LOTES ------------
	ArquivoFOEsocialLotes = "..\\temp\\2_foesocial_lotes.csv"
	while((getline < ArquivoFOEsocialLotes) > 0){
		codi_emp_lotes = $1
		i_dados_evento_esocial_lotes = $2
		
		if( VEsocialExiste[codi_emp_lotes, i_dados_evento_esocial_lotes] == 1 )
			print $0 > "..\\prontos\\2_foesocial_lotes.csv"
		else
			continue
	} close(ArquivoFOEsocialLotes)
	
	# --------- FOESOCIAL_LOTES ------------
	ArquivoFOEsocialLotesEnvio = "..\\temp\\2_foesocial_lotes_envios.csv"
	while((getline < ArquivoFOEsocialLotesEnvio) > 0){
		codi_emp_lotes_envio = $1
		i_dados_evento_esocial_lotes_envio = $2
		
		if( VEsocialExiste[codi_emp_lotes_envio, i_dados_evento_esocial_lotes_envio] == 1 )
			print $0 > "..\\prontos\\2_foesocial_lotes_envios.csv"
		else
			continue
	} close(ArquivoFOEsocialLotesEnvio)
}
