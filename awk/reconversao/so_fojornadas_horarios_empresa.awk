BEGIN {
	FS = ";";
	OFS = FS;
	ColunaEmpresaArquivo01 = 1 # fojornadas
	ColunaJornadaArquivo01 = 2 # fojornadas
	ColunaEmpresaArquivo02 = 1 # fojornadas_horarios
	ColunaJornadaArquivo02 = 2 # fojornadas_horarios
	}
{
	if (FILENAME == ARGV[1]) {
		i = $ColunaEmpresaArquivo01"-"$ColunaJornadaArquivo01
		ind[i] = i
	} else {
		o = $ColunaEmpresaArquivo02"-"$ColunaJornadaArquivo02
		if(ind[o] != "") { # o ind[i] é o vetor com as informações armazenas dos funcionarios, então compara se os valores deste vetor com os dados de "o" tem valor válido, 
			codi_emp = $ColunaEmpresaArquivo02				#se acaso tiver então gera, se não jogo no arquivo de troca_salario em que nao existe empregado
			i_jornada = $ColunaJornadaArquivo02
			i_horarios = $5
			sequencial = $3
			dia_semana = $4
			if (JaImprimiuRegistro[codi_emp, i_jornada, i_horarios, sequencial, dia_semana] == 0) {															 
				print $0								
				JaImprimiuRegistro[codi_emp, i_jornada, i_horarios, sequencial, dia_semana] = 1
			}
		}
		
	}	
}