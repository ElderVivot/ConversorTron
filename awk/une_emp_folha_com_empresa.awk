BEGIN{
	FS = ";";
	OFS = FS;
}
{
	if (FILENAME == ARGV[1]){ # empresas_folha
		i = $1
		emp[i] = $1
		linha[i] = $0
	}
	else{
		if(FNR == 1){
			for (c=1; c<=NF; c++)
				Coluna[$c] = c
		}
	
		emp2 = $1
		uefi_emp = Campo("uefi_emp")
		ucta_emp = Campo("ucta_emp")
		
		if( emp[emp2] != "" )
			print $0, linha[emp2]
		else if( emp[emp2] == "" && ( uefi_emp == 1 || ucta_emp == 1 ) )
			print $0, "", "", "", "", 0, "", "", "", "", "" # 10 CAMPOS SEM INFORMACAO NENHUMA PARA EMPRESAS QUE NAO USA FOLHA E O QUINTO COMO ZERO INDICANDO QUE NAO USA FOLHA
		else	
			print $0 > "..\\temp\\empresas_nao_usa_folha_esc_cta.csv"
	} 
}