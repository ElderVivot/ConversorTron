BEGIN { 
	FS = ";"; 
	OFS = FS;
}
{
	if(FILENAME == ARGV[1]){ # SERVICOS GERADO PELA EMPRESA
		codi_emp = $1
		emp[codi_emp] = $1
		data_inicio[codi_emp] = $32
		
		print $0
	}
	else{
		codi_emp_2 = $1
		if( emp[codi_emp_2] != "" ){
			$32 = data_inicio[codi_emp_2]
			
			print $0
		}else
			print $0 > "..\\temp\\foservicos02_sem_empresa.csv"
	}	 
}