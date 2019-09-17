BEGIN{
	FS = ";";
	OFS = FS;
	seq = 1;
	sem_uso = "NULO";
	duracao_jornada = sem_uso;
	duracao_intervalo_minutos = sem_uso;
	
	# DADOS DA TABELA FOHORARIOS
	data_inicio = sem_uso # VAI SER IMPLEMENTADO NO AWK DATA_INICIO.AWK
	situacao = 1
	data_inativacao = sem_uso
	duracao_intervalo = sem_uso
	origem_reg = 1
	variacao_diaria_entrada_saida = 0
}
{
	codi_emp = $1
	i_jornada = $2
	hora_entrada = $4
	hora_saida = $5
	hora_inicio = $7
	hora_fim = $8
	tipo = $6
	duracao_jornada_minutos = $9
	
	j = codi_emp "-" hora_entrada "-" hora_inicio "-" hora_fim "-" hora_saida "-" tipo
	
	if( int(tipo) == 1)
		nome = hora_entrada " AS " hora_saida
	else if( int(tipo) == 3)
		nome = "FOLGA"
	else
		nome = "COMPENSADO"
	
	# SOMENTE INTERVALOS QUE REALMENTE SAO INTERVALOS
	if( hora_inicio != "" && hora_fim != "" && hora_inicio != hora_fim )
		tipo_intervalo = 2 # FIXO
	else
		tipo_intervalo = 0 # NÃO POSSUI
		
	# TRATA QUANDO FOR INTERJORNADA (COMECA NUM DIA E TERMINA NO OUTRO). ISTO EH NECESSARIO PARA QUE A DURACAO_JORNADA_MINUTOS SEJA FEITO O CALCULO CORRETO, E NAO FIQUE NEGATIVO
	if( int( soNumeros( hora_saida ) ) < int( soNumeros( hora_fim ) ) ){
		hora_saida_calc = int( substr( hora_saida, 1, 2 ) ) + 24
		hora_saida_calc = hora_saida_calc ":" substr( hora_saida, 4, 2 )
	} else
		hora_saida_calc = hora_saida
	
	# TRATA QUANDO FOR INTERJORNADA (COMECA NUM DIA E TERMINA NO OUTRO). ISTO EH NECESSARIO PARA QUE A DURACAO_JORNADA_MINUTOS SEJA FEITO O CALCULO CORRETO, E NAO FIQUE NEGATIVO
	if( int( soNumeros( hora_inicio ) ) < int( soNumeros( hora_entrada ) ) ){
		hora_inicio_calc = int( substr( hora_inicio, 1, 2 ) ) + 24
		hora_inicio_calc = hora_inicio_calc ":" substr( hora_inicio, 4, 2 )
	} else
		hora_inicio_calc = hora_inicio
		
	# TRATA QUANDO FOR INTERJORNADA (COMECA NUM DIA E TERMINA NO OUTRO) E QUANDO O HORARIO NAO TEM INTERVALO (COMUM NOS SABADOS)
	if( int( soNumeros( hora_saida ) ) < int( soNumeros( hora_entrada ) ) ){
		hora_saida_calc_2 = int( substr( hora_saida, 1, 2 ) ) + 24
		hora_saida_calc_2 = hora_saida_calc_2 ":" substr( hora_saida, 4, 2 )
	} else
		hora_saida_calc_2 = hora_saida
	
	
	# CÁLCULO DA QUANTIDADE DE HORAS TRABALHADA NO DIA
	duracao_jornada_minutos = transformaHoraEmMinuto(duracao_jornada_minutos)
	if( duracao_intervalo_minutos > 0 )
		duracao_jornada_minutos = duracao_jornada_minutos
	else{
		# CÁLCULO DA QUANTIDADE DE HORAS TRABALHADA NO DIA
		# TRATA QUANDO FOR INTERJORNADA (COMECA NUM DIA E TERMINA NO OUTRO) E QUANDO O HORARIO NAO TEM INTERVALO (COMUM NOS SABADOS)
		if( hora_inicio != hora_fim )
			duracao_jornada_minutos = ( transformaHoraEmMinuto(hora_saida_calc) - transformaHoraEmMinuto(hora_fim) ) + ( transformaHoraEmMinuto(hora_inicio_calc) - transformaHoraEmMinuto(hora_entrada) )
		else
			duracao_jornada_minutos = ( transformaHoraEmMinuto(hora_saida_calc_2) - transformaHoraEmMinuto(hora_entrada) )
	}
	
	i_dados_evento_esocial = ""
	i_dados_evento_esocial = RetornaILote_5(codi_emp, "1050", i_jornada, hora_entrada, hora_saida )
	
	i_lote_esocial = i_dados_evento_esocial
	
	status_esocial = IfElse( i_lote_esocial == "NULO", "NULO", 3 )
	
	enviar_esocial = IfElse( i_lote_esocial == "NULO", 1, 0 )
	
	inclusao_validada_esocial = IfElse( i_lote_esocial == "NULO", 0, 1 )
	
	gerar_retificacao_esocial = 0
	
	if(JaImprimiuRegistro[j] == 0){
		
		# GERA CODIGO DO I_HORARIO
		i = codi_emp
		if(i == i_ant)
			i_horario = seq++
		else{
			seq = 1
			i_horario = seq++
		}
		i_ant = i
		
		codigo_esocial = ""
		codigo_esocial = RetornaCodigoEsocial_4( codi_emp, "1050", i_jornada, hora_entrada, hora_saida )
		codigo_esocial = IfElse( codigo_esocial == "NULO", i_horario, codigo_esocial ) 
		
		print codi_emp, i_horario, nome, data_inicio, situacao, data_inativacao, tipo, hora_entrada, hora_saida, tipo_intervalo, duracao_intervalo, origem_reg, codigo_esocial,
		      variacao_diaria_entrada_saida, duracao_jornada, duracao_jornada_minutos, duracao_intervalo_minutos, i_dados_evento_esocial, i_lote_esocial, status_esocial, enviar_esocial, 
			  inclusao_validada_esocial, gerar_retificacao_esocial > "..\\temp\\fohorarios.csv"
			  
		# ARQUIVO AUXILIAR QUE SERVIRA PRA RETORNAR O CODIGO DO HORARIO PARA O ARQUIVO FOJORNADAS_HORARIOS
		print codi_emp, i_horario, hora_entrada, hora_inicio, hora_fim, hora_saida, tipo > "..\\temp\\horarios_auxiliar.csv"
			  
		# DADOS DA TABELA FOHORARIOS_INTERVALOS
		i_intervalo = 1
		intervalo_principal = 1
		
		if(tipo_intervalo == 2)
			print codi_emp, i_horario, i_intervalo, hora_inicio, hora_fim, intervalo_principal, origem_reg > "..\\temp\\fohorarios_intervalos.csv"
		
		JaImprimiuRegistro[j] = 1
	}
		
}