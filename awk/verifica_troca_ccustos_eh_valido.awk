BEGIN { 
	FS = ";" ; OFS = FS;
}
{
	# CODI_EMP - I_EMPREGADOS - DATA_TROCA
	i = $1 "-" $2 "-" $4
	
	# CODI_EMP - I_EMPREGADOS - I_CCUSTOS
	j = $1 "-" $2 "-" $3
	
	if(j == j_ant)
		print $0 > "..\\temp\\troca_ccustos_repetidos.csv"
	else{
		if(JaImprimiuRegistro[i] == 0){
			print $0
			JaImprimiuRegistro[i] = 1
		}
		else
			print $0 > "..\\temp\\troca_ccustos_mesma_data.csv" 
	}
	
	j_ant = j
}