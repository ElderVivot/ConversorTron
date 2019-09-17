BEGIN {
	FS = ";"; 
	OFS = FS;
	sem_uso = "NULO";
}
{
	codi_emp = $1
	
	i_cargos = $43
	
	i_depto = $51
	
	i_jornada = $232
	
	i_ccustos = $22
	
	# DADOS GERAIS PARA TODOS
	origem_reg = 1
	data_inicio = "01/01/1900" # DEPOIS VAI SER IMPLEMENTADO PARA BUSCAR DO ARQUIVO DATA_INICIO.AWK
	situacao = 1
	data_inativacao = sem_uso
	tipo = 1 # PADRAO
	
	# DADOS ESPECIFICOS DO CARGO
	cbo = sem_uso
	atividade = sem_uso
	ppp_campo_1 = 1
	ppp_campo_2 = 1
	ppp_campo_3 = 1
	ppp_campo_4 = 1
	ppp_campo_5 = 1
	ppp_observacoes = sem_uso
	gerencia_supervisao = 0
	cbo2002 = sem_uso
	i_dados_evento_esocial = sem_uso
	i_lote_esocial = sem_uso
	status_esocial = sem_uso
	enviar_esocail = 1
	inclusao_validada_esocial = 0
	gerar_retificao_esocial = 0
	
	# DADOS ESPECIFICOS DO DEPARTAMENTO
	endereco = sem_uso
	numero = sem_uso
	bairro = sem_uso
	cidade = sem_uso
	estado = sem_uso
	cep = sem_uso
	
	# DADOS ESPECIFICOS DO FOJORNADAS
	tipo_escala = 0 # NAO POSSUI
	escala = sem_uso
	
	# DADOS ESPECIFICOS DO FOJORNADAS_HORARIOS
	sequencial = 1
	i_horario = 999
	dia_semana = 1 # SEGUNDA A SEXTA
	
	# DADOS ESPECIFICOS DO FOHORARIOS
	hora_entrada = "08:00"
	hora_saida = "18:00"
	duracao_jornada = sem_uso
	duracao_intervalo = sem_uso
	variacao_diaria_entrada_saida = 0
	tipo_intervalo = 2 # FIXO
	codigo_esocial = i_horario
	duracao_jornada_minutos = 480
	duracao_intervalo_minutos = sem_uso
	
	# DADOS ESPECIFICOS DO FOHORARIOS_INTERVALOS
	i_intervalo = 1
	hora_inicio = "12:00"
	hora_fim = "14:00"
	intervalo_principal = 1
	
	# DADOS ESPECIFICOS DO CENTRO DE CUSTO
	usou_epi_por_iniviabilidade_apos_tentativa_implementacao_medidas_protecao_coletiva = 1
	foram_obersavadas_condicoes_funcionamento_uso_epi_conforme_especificacao_fabricante = 1
	foi_observado_prazo_validade_conforme_certificado_aprovacao_mte = 1
	foi_observada_periodicidade_troca_definida_programas_ambientais = 1
	foi_observada_higienizacao = 1
	tipo = sem_uso
	i_ccustos_sintetico = sem_uso
	mascara = sem_uso
	
	# GERA O CARGO PADRAO
	if( i_cargos == 999 ){
		codi_esocial = i_cargos
		
		if( JaImprimiuRegistroCargo[codi_emp] == 0 ){
			print codi_emp, i_cargos, "CARGO GERAL", cbo, cbo2002, origem_reg, atividade, ppp_campo_1, ppp_campo_2, ppp_campo_3, ppp_campo_4, ppp_campo_5, ppp_observacoes, 
			      gerencia_supervisao, data_inicio, situacao, data_inativacao, codi_esocial, i_dados_evento_esocial, i_lote_esocial,
				      status_esocial, enviar_esocail, inclusao_validada_esocial, gerar_retificao_esocial >> "..\\temp\\cargos.csv"
			
			JaImprimiuRegistroCargo[codi_emp] = 1
		}
	}
	
	# GERA O DEPTO PADRAO
	if( i_depto == 999){
		if( JaImprimiuRegistroDepto[codi_emp] == 0 ){
			print codi_emp, i_depto, "DEPARTAMENTO GERAL", endereco, numero, bairro, cidade, estado, cep, origem_reg, data_inicio, situacao, data_inativacao >> "..\\temp\\deptos.csv"
			
			JaImprimiuRegistroDepto[codi_emp] = 1
		}
	}
	
	# GERA O CENTRO DE CUSTO
	if( i_ccustos == 999){
		if( JaImprimiuRegistroCCustos[codi_emp] == 0 ){
			print codi_emp, i_ccustos, "CENTRO DE CUSTO GERAL", origem_reg, usou_epi_por_iniviabilidade_apos_tentativa_implementacao_medidas_protecao_coletiva,
				  foram_obersavadas_condicoes_funcionamento_uso_epi_conforme_especificacao_fabricante, foi_observado_prazo_validade_conforme_certificado_aprovacao_mte,
				  foi_observada_periodicidade_troca_definida_programas_ambientais, foi_observada_higienizacao, tipo, i_ccustos_sintetico, mascara >> "..\\temp\\ccustos.csv"
		}
		
		JaImprimiuRegistroCCustos[codi_emp] = 1
	}
	
	# GERA FOJORNADAS, FOJORNADAS_HORARIOS, FOHORARIOS E FOHORARIOS_INTERVALOS PADRAO
	if( i_jornada == 999){
		
		if( JaImprimiuRegistroJornada[codi_emp] == 0 ){
			
			# FOJORNADAS
			print codi_emp, i_jornada, "JORNADA GERAL", data_inicio, situacao, data_inativacao, tipo, tipo_escala, escala, origem_reg >> "..\\temp\\fojornadas.csv"
			
			# FOJORNADAS_HORARIOS
			print codi_emp, i_jornada, sequencial, dia_semana, i_horario, origem_reg, sequencial_dia_semana >> "..\\temp\\fojornadas_horarios02.csv"
			
			# FOHORARIOS
			print codi_emp, i_horario, "HORARIO GERAL", data_inicio, situacao, data_inativacao, tipo, hora_entrada, hora_saida, tipo_intervalo, duracao_intervalo, 
			      origem_reg, codigo_esocial, variacao_diaria_entrada_saida, duracao_jornada, duracao_jornada_minutos, duracao_intervalo_minutos, i_dados_evento_esocial,
				  i_lote_esocial, status_esocial, enviar_esocail, inclusao_validada_esocial, gerar_retificao_esocial >> "..\\temp\\fohorarios.csv"
			
			# FOHORARIOS_INTERVALOS
			print codi_emp, i_horario, i_intervalo, hora_inicio, hora_fim, intervalo_principal, origem_reg >> "..\\temp\\fohorarios_intervalos.csv"
			
			JaImprimiuRegistroJornada[codi_emp] = 1
		}
	}
}