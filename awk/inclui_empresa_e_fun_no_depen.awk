BEGIN { 
	FS = ";"; 
	OFS = FS;
}
{
	if (FILENAME == ARGV[1]) # FUNCIONARIOS
	{
		i_pessoa = $4
		codi_emp[i_pessoa] = $1
		i_funcionarios[i_pessoa] = $2
		codi_pessoa[i_pessoa] = $4
	}
	else{
		i_pessoa_2 = $1
		if (codi_pessoa[i_pessoa_2] != ""){
			$1 = i_funcionarios[i_pessoa_2]
			print codi_emp[i_pessoa_2], $0
		}else
			print $0 > "..\\temp\\depen_sem_fun.csv"
	}
}