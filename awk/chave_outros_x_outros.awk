# *****_CARREGA --> GUARDA INFORMACAO DO CAMPO AINDA QUANDO ESTA LENDO
# *****_FUNCTION --> LE AS INFORMACOES PASSADAS NO ARGUMENTO E GUARDA PRA RETORNAR DEPOIS

BEGIN{
	FS = ";";
	seq = 1;

	# --------- HORARIOS_AUXILIAR -------------
	ArquivoHorario = "..\\temp\\horarios_auxiliar.csv"
	while((getline < ArquivoHorario) > 0){
		codi_emp_carrega = $1
		i_horario_carrega = $2
		hora_entrada_carrega = $3
		hora_inicio_carrega = $4
		hora_fim_carrega = $5
		hora_saida_carrega = $6
		tipo_horario_carrega = $7
		
		vetor_horario_carrega = codi_emp_carrega "-" hora_entrada_carrega "-" hora_inicio_carrega "-" hora_fim_carrega "-" hora_saida_carrega "-" tipo_horario_carrega
		
		CodigoHorarioCarrega[vetor_horario_carrega] = i_horario_carrega
		
	} close(ArquivoHorario)
	
	# --------- HORARIOS_SEMANA03 -------------
	ArquivoHorario = "..\\temp\\horarios_semana03.csv"
	while((getline < ArquivoHorario) > 0){
		codi_emp_dia_semana_carrega = $1
		i_jornada_carrega = $2
		dia_semana_carrega = $3
		hora_entrada_dia_semana_carrega = $4
		hora_saida_dia_semana_carrega = $5
		hora_inicio_dia_semana_carrega = $7
		hora_fim_dia_semana_carrega = $8
		
		# CRIA O VETOR PRA RECEBER O CODIGO DA EMPRESA E JORNADA
		vetor_empresa_jornada_carrega = codi_emp_dia_semana_carrega "-" i_jornada_carrega
		
		# VAI CONTAR OS HORARIOS DE CADA DIA SEMANA E VERIFICAR SE EH IGUAL AO ANTERIOR --> VAI SERVIR PRA VERIFICAR SE A JORNADA EH DE SEGUNDA A SEXTA OU SE EH DE CADA DIA DA SEMANA SEPARADO
		vetor_horario_semana_carrega = codi_emp_dia_semana_carrega "-" i_jornada_carrega "-" hora_entrada_dia_semana_carrega "-" hora_inicio_dia_semana_carrega "-" hora_fim_dia_semana_carrega "-" hora_saida_dia_semana_carrega
		if(vetor_horario_semana_carrega == vetor_horario_semana_carrega_ant && dia_semana_carrega >= 1 && dia_semana_carrega <= 5)
			contador[vetor_empresa_jornada_carrega] = seq++
		if(vetor_horario_semana_carrega != vetor_horario_semana_carrega_ant && dia_semana_carrega >= 1 && dia_semana_carrega <= 5){
			seq = 1
			contador[vetor_empresa_jornada_carrega] = seq++
		}
		vetor_horario_semana_carrega_ant = vetor_horario_semana_carrega
		
		ContadorDiaSemanaCarrega[vetor_empresa_jornada_carrega] = contador[vetor_empresa_jornada_carrega]
		
	} close(ArquivoHorario)
}

# CODIGO DO JORNADA
function RetornaCodigoHorario(argVetorHorarioFunction){
	
	CodigoHorarioFunction = ""
	
	vetor_horario_fuction = ""
	vetor_horario_fuction = argVetorHorarioFunction
	
	if(CodigoHorarioCarrega[vetor_horario_fuction] != "")
		CodigoHorarioFunction = CodigoHorarioCarrega[vetor_horario_fuction]
	else
		CodigoHorarioFunction = 999 # CODIGO GERAL DO HORARIO
	
	return CodigoHorarioFunction
}

# CONTADOR DO DIA DA SEMANA
function RetornaContadorDiaSemana(argVetorContadorDiaSemana){
	
	ContadorDiaSemanaFunction = ""
	
	vetor_horario_semana_function = ""
	vetor_horario_semana_function = argVetorContadorDiaSemana
	
	if(ContadorDiaSemanaCarrega[vetor_horario_semana_function] != "")
		ContadorDiaSemanaFunction = ContadorDiaSemanaCarrega[vetor_horario_semana_function]
	else
		ContadorDiaSemanaFunction = 0
	
	return ContadorDiaSemanaFunction
}