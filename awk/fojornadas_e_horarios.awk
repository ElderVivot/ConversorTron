BEGIN{
	FS = ";";
	OFS = FS;
}
{
	codi_emp = $1
	i_jornada = $2
	dia_semana = $3 + 1 # NA TRON A SEGUNDA COMECA COM 1, NA DOMINIO COMECA COM 2
	hora_entrada = $4
	hora_saida = $5
	hora_inicio = $7
	hora_fim = $8
	nome = $10
	tipo_horario = $6
	
	# DADOS DA TABELA FOJORNADAS
	sem_uso = "NULO"
	data_inicio = sem_uso # ALTERAR DEPOIS
	situacao = 1
	data_inativacao = sem_uso
	tipo = 1 # PADRAO
	origem_reg = 1
	tipo_escala = 0 # NAO POSSUI
	escala = sem_uso
	
	# IMPRIME JORNADA NORMAL SEM SER A PADRAO
	j = codi_emp "-" i_jornada
	if(JaImprimiuRegistro[j] == 0){
		print codi_emp, i_jornada, nome, data_inicio, situacao, data_inativacao, tipo, tipo_escala, escala, origem_reg >> "..\\temp\\fojornadas.csv"
		
		JaImprimiuRegistro[j] = 1
	}
	
	# DADOS DA TABELA FOJORNADAS_HORARIOS
	vetor_horario = codi_emp "-" hora_entrada "-" hora_inicio "-" hora_fim "-" hora_saida "-" tipo_horario
	i_horario = RetornaCodigoHorario(vetor_horario)
	sequencial = 0 # VAI SER GERADO NO PROXIMO AWK
	sequencial_dia_semana = sem_uso
	
	# VAI SERVIR PRA VERIFICAR SE A JORNADA EH DE SEGUNDA A SEXTA OU SE EH DE CADA DIA DA SEMANA
	contador_dia_semana = RetornaContadorDiaSemana(codi_emp "-" i_jornada)
	
	# SEGUNDA A SEXTA --> SEM SABADO E DOMINGO
	if(contador_dia_semana == 5 && dia_semana >= 2 && dia_semana <= 6){
		dia_semana_auxiliar = 1 # SEGUNDA A SEXTA
		
		i = codi_emp "-" i_jornada "-" i_horario
		if(JaImprimiuRegistro_2[i] == 0){
			print codi_emp, i_jornada, sequencial, dia_semana_auxiliar, i_horario, origem_reg, sequencial_dia_semana >> "..\\temp\\fojornadas_horarios.csv"
			
			JaImprimiuRegistro_2[i] = 1
		}
	}
	# SEGUNDA A SEXTA --> SOMENTE SABADO E DOMINGO
	else if(contador_dia_semana == 5 && ( dia_semana >= 7 || dia_semana <= 8 ) )
		print codi_emp, i_jornada, sequencial, dia_semana, i_horario, origem_reg, sequencial_dia_semana >> "..\\temp\\fojornadas_horarios.csv"
	# JORNADAS QUE DE SEGUNDA A SEXTA SAO HORARIOS DIFERENTES
	else
		print codi_emp, i_jornada, sequencial, dia_semana, i_horario, origem_reg, sequencial_dia_semana >> "..\\temp\\fojornadas_horarios.csv"
		
}