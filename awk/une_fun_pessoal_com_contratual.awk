BEGIN { 
	FS = ";"; 
	OFS = FS;
}
{
	# ARMAZENA AS INFORMACOES PESSOAIS DO EMPREGADO
	if (FILENAME == ARGV[1]) {
		codigo_pessoal = $1;
		INFORMACAO_PESSOAL[codigo_pessoal] = $0;
	} else {
		# UNE CONTRATUAIS COM PESSOAIS
		codigo_pessoal = $4;
		if (INFORMACAO_PESSOAL[codigo_pessoal] != "") {
			print $0, INFORMACAO_PESSOAL[codigo_pessoal]
		} else {
			campos = NF
			
			# CAMPOS QUE NAO SERAO NULOS ACASO NAO EXISTE AS INFORMACOES PESSOAIS
			$(campos + 1) = "" # CODIGO PESSOAL QUE NAO EXISTE
			$(campos + 2) = "COLABORADOR SEM NOME" # NOME DO EMPREGADO
			
			# SE MUDAR O NUMERO DE CAMPOS NO ARQUIVO FUN_PESSOAL.AWK DEVERA SER MUDADO AQUI TAMBEM
			for (i = 3; i <= 18; i++) { 
				$(campos + i) = "NULO" 
			}
			
			print $0
		}
	}
}