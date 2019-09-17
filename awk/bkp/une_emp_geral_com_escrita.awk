BEGIN { 
	FS = ";"; 
	OFS = FS;
}
{
	if (FILENAME == "..\\temp\\empresas_geral.csv"){
		i = $1
		emp[i] = $1
		linha[i] = $0
	}
	else{
		emp2 = $1
		if(emp[emp2] != "")
			print linha[emp2], $0
		else
			print $0 > "..\\temp\\empresas_nao_existe_escrita.csv"
	}	 
}