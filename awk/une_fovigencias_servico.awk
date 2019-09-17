BEGIN { 
	FS = ";"; 
	OFS = FS;
}
{
	if(FILENAME == ARGV[1]){ # SERVICOS GERADO PELA EMPRESA
		codi_emp = $1
		emp[codi_emp] = $1
		data_inicio[codi_emp] = $3
		codigo_fpas[codi_emp] = $13
		
		print $0
	}
	else{
		codi_emp_2 = $1
		if( emp[codi_emp_2] != "" ){
			$3 = data_inicio[codi_emp_2]
			$13 = codigo_fpas[codi_emp_2]
			
			print $0
		}else
			print $0 > "..\\temp\\fovigencias_servico02_sem_empresa.csv"
	}	 
}