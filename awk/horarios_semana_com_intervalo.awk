BEGIN {
	FS = ";";
	OFS = FS;
}
{
	if (FILENAME == ARGV[1]) # INTERVALOS
	{
		if (FNR == 1) {
			for (c = 1; c <= NF; c++)
				Coluna[$c] = c
			next
		}
		
		cod_intervalo = Campo("CODINT")
		cod_intervalo = soNumeros(cod_intervalo)
		
		i_intervalos[cod_intervalo] = cod_intervalo
		
		inicio_intervalo[cod_intervalo] = Campo("HORINIINT")
		inicio_intervalo[cod_intervalo] = Trim(inicio_intervalo[cod_intervalo])
		inicio_intervalo[cod_intervalo] = substr(inicio_intervalo[cod_intervalo], 1, 5)
		
		fim_intervalo[cod_intervalo] = Campo("HORTERINT")
		fim_intervalo[cod_intervalo] = Trim(fim_intervalo[cod_intervalo])
		fim_intervalo[cod_intervalo] = substr(fim_intervalo[cod_intervalo], 1, 5)
	}
	else{
	
		if (FNR == 1) {
			for (c = 1; c <= NF; c++)
				Coluna[$c] = c
			next
		}
		
		i_horarios = Campo("CODHORTRB")
		i_horarios = soNumeros(i_horarios)
		
		dia_semana = Campo("CODDIASEM")
		dia_semana = soNumeros(dia_semana)
		
		i_intervalos_2 = Campo("CODINT")
		i_intervalos_2 = soNumeros(i_intervalos_2)
		
		if (i_intervalos[i_intervalos_2] != ""){
			fim_intervalo_2 = fim_intervalo[i_intervalos_2]
			inicio_intervalo_2 = inicio_intervalo[i_intervalos_2]
		}
		else{
			fim_intervalo_2 = ""
			inicio_intervalo_2 = ""
		}
		
		print i_horarios, dia_semana, inicio_intervalo_2, fim_intervalo_2
	}	
}