{
	if (FILENAME == ARGV[1]){ # dados\horarios_cod_nome
		FS = ";"
		
		if (FNR == 1) {
			for (c = 1; c <= NF; c++)
				Coluna[$c] = c
			next
		}
		
		i = Campo("CODHORTRB")
		i = soNumeros(i)
		
		i_horarios[i] = i
	
		descricao[i] = Campo("DSCHORTRB")
		descricao[i] = Trim(descricao[i])
		descricao[i] = subsCharEspecial(descricao[i])
		descricao[i] = upperCase(descricao[i])
	}
	else{
		FS = ";";
		OFS = FS;
		
		i_horarios_2 = $1
		
		o = i_horarios_2
		if (i_horarios[o] != "")
			descricao_2 = descricao[o]
		
		if(descricao_2 == "")
			descricao_2 = "JORNADA SEM NOME"
		else
			descricao_2 = descricao_2
		
		print $0, descricao_2
	}
}