BEGIN { 
	FS = ";"; 
	OFS = FS;
}
{
	if (FILENAME == ARGV[1]){ # empresas_geral
		i = $1
		emp[i] = $1
		linha[i] = $0
	}
	else{
		emp2 = $1
		if(emp[emp2] != "")
			print linha[emp2], $0
		else
			print $0 > "..\\temp\\empresas_nao_existe_detalhe.csv"
	}	 
}