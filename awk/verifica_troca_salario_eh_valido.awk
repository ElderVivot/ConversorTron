BEGIN { 
	FS = ";" ; OFS = FS;
}
{
	i = $1 "-" $2 "-" $3
	
	j = $1 "-" $2
	
	h = $1 "-" $2 "-" $4
	
	valor = $4
	gsub(/[^0-9]/, "", valor)
	valor = int(valor)
	
	# VAI GUARDANDO O MAIOR SALARIO LIDO
	if( j == j_ant ){
		if( int(valor) > int(valor_maior) )
			valor_maior = valor
		else
			valor_maior = valor_maior
	}
	else
		valor_maior = valor
	
	# VAI VERIFICAR SE TRATA DE UMA TROCA DE SALARIO VALIDO
	if(j == j_ant && int(valor_maior) > int(valor) ){
		print $0 > "..\\temp\\troca_salario_menor_ou_igual_anterior.csv"
	}
	else{
		if(JaImprimiuRegistro[i] == 0){
			
			if(JaImprimiuRegistro[h] == 0){
				print $0
				JaImprimiuRegistro[h] = 1
			}
			else
				print $0 > "..\\temp\\troca_salario_menor_ou_igual_anterior.csv"
			
			JaImprimiuRegistro[i] = 1
		}
		else
			print $0 > "..\\temp\\troca_salario_mesma_data.csv"
		
	}
	
	i_ant = i
	j_ant = j
	valor_ant = valor
	
}