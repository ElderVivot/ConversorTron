BEGIN {
	FS = ";";
	OFS = FS;
	ColunaEmpresaArquivo01 = 1 # fohorarios
	ColunaHorarioArquivo01 = 2 # fohorarios
	ColunaEmpresaArquivo02 = 1 # fohorarios_intervalos
	ColunaHorarioArquivo02 = 2 # fohorarios_intervalos
	}
{
	if (FILENAME == ARGV[1]) {
		i = $ColunaEmpresaArquivo01"-"$ColunaHorarioArquivo01
		ind[i] = i
	} else {
		o = $ColunaEmpresaArquivo02"-"$ColunaHorarioArquivo02
		if(ind[o] != "") { # o ind[i] é o vetor com as informações armazenas dos funcionarios, então compara se os valores deste vetor com os dados de "o" tem valor válido, 
			codi_emp = $ColunaEmpresaArquivo02				#se acaso tiver então gera, se não jogo no arquivo de troca_salario em que nao existe empregado
			i_horarios = $ColunaHorarioArquivo02
			hora_inicio = $3
			hora_fim = $4
			if (JaImprimiuRegistro[codi_emp, i_horarios, hora_inicio, hora_fim] == 0)
			{															 
				print $0								
				JaImprimiuRegistro[codi_emp, i_horarios, hora_inicio, hora_fim] = 1
			}
		}
	}	
}