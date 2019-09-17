BEGIN { 
	FS = ";"; 
	OFS = FS;
}
{
	# ARMAZENA AS INFORMACOES PROFISSIONAIS DO EMPREGADO
	if (FILENAME == ARGV[1]) { # FUN_DADOS.CSV
		codigo_pessoal = $1;
		INFORMACAO_PROFFISIONAL[codigo_pessoal] = $0;
	} else {
		# UNE CONTRATUAL COM PROFISSIONAL
		codigo_pessoal = $4;
		if (INFORMACAO_PROFFISIONAL[codigo_pessoal] != "") {
			print $0, INFORMACAO_PROFFISIONAL[codigo_pessoal]
		} else {
			campos = NF
			
			# CAMPOS QUE NAO SERAO NULOS ACASO NAO EXISTE AS INFORMACOES PESSOAIS
			$(campos + 1) = "" # CODIGO PESSOAL QUE NAO EXISTE
			$(campos + 2) = "NULO" # DATA NASCIMENTO
			$(campos + 3) = "M" # SEXO
			$(campos + 4) = "S" # ESTADO CIVIL
			$(campos + 5) = "9" # COR
			$(campos + 6) = "7" # GRAU INSTRUCAO
			
			# SE MUDAR O NUMERO DE CAMPOS NO ARQUIVO FUN_DADOS.AWK DEVERA SER MUDADO AQUI TAMBEM
			for (i = 7; i <= 32; i++) { 
				$(campos + i) = "NULO" 
			}
			
			print $0
		}
	}
}