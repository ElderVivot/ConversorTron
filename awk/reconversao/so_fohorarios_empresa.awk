BEGIN {
	FS = ";";
	OFS = FS;
	ColunaEmpresaArquivo01 = 1 # fojornadas_horarios
	ColunaHorarioArquivo01 = 5 # fojornadas_horarios
	ColunaEmpresaArquivo02 = 1 # fohorarios
	ColunaHorarioArquivo02 = 2 # fohorarios
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
			if (JaImprimiuRegistro[codi_emp, i_horarios] == 0)
			{															 
				print $0								
				JaImprimiuRegistro[codi_emp, i_horarios] = 1
			}
		}
		
	}	
}