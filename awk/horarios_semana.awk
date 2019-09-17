BEGIN{
	FS = ";"
	OFS = FS;
}
{
	if (FILENAME == ARGV[1]){ # temp\horarios_semana_com_intervalo
		i_horarios = $1
		dia_semana = $2
		i = i_horarios "-" dia_semana
		inicio_intervalo[i] = $3
		termino_intervalo[i] = $4
		vetor[i] = i
	}
	else{
		if (FNR == 1) {
			for (c = 1; c <= NF; c++)
				Coluna[$c] = c
			next
		}
		
		i_horarios_2 = Campo("CODHORTRB")
		i_horarios_2 = soNumeros(i_horarios_2)
		
		dia_semana_2 = Campo("CODDIASEM")
		dia_semana_2 = soNumeros(dia_semana_2)
		
		hora_inicio = Campo("INIHORTRBDIASEM")
		hora_inicio = Trim(hora_inicio)
		hora_inicio = substr(hora_inicio, 1, 5)
		
		hora_fim = Campo("FIMHORTRBDIASEM")
		hora_fim = Trim(hora_fim)
		hora_fim = substr(hora_fim, 1, 5)
		
		tipo_dia = Campo("TIPDIA")
		tipo_dia = Trim(tipo_dia)
		tipo_dia = upperCase(tipo_dia)
		if(tipo_dia == "N") 
			tipo_dia = 1 # TRABALHADO
		else if(tipo_dia == "D") 
			tipo_dia = 3 # FOLGA
		else if(tipo_dia == "C") 
			tipo_dia = 2 # COMPENSADO
		else 
			tipo_dia = 3 # FOLGA
		
		duracao_horario = Campo("CRGHOR")
		duracao_horario = Trim(duracao_horario)
		duracao_horario = substr(duracao_horario, 1, 5)
		
		o = i_horarios_2 "-" dia_semana_2
		if (vetor[o] != ""){
			inicio_intervalo_2 = inicio_intervalo[o]
			termino_intervalo_2 = termino_intervalo[o]
		}
		else
		{
			inicio_intervalo_2 = ""
			termino_intervalo_2 = ""
		}
		
		print i_horarios_2, dia_semana_2, hora_inicio, hora_fim, tipo_dia, inicio_intervalo_2, termino_intervalo_2, duracao_horario
	}
}