BEGIN { 
	ArquivoSaida1 = "..\\prontos\\" Arquivo ".csv"; 
	ArquivoSaida2 = "..\\temp\\" Arquivo "_nao.csv";
	FS = ";";
	OFS = FS;
}
{
	if (FILENAME == ARGV[1]) {
		i = $1 #codi_emp original
		icod[i] = i #codi_emp original
		inov[i] = $2 #novo_codigo vair receber da coluna 2
	} else {
		
		if (icod[$ColunaCodiEmp] != "") { #codi_emp ($1) != "" entao le
			$ColunaCodiEmp = inov[$ColunaCodiEmp]
			
			data_inicio_cli_for = RetornaDataInicio($ColunaCodiEmp)
			$31 = data_inicio_cli_for
			
			if( FILENAME == "..\\temp\\clientes.csv" ){
				codi_cli = RetornaCodigoCliente($ColunaCodiEmp)
				$2 = int($2) + codi_cli
			}
			else if( FILENAME == "..\\temp\\fornecedores.csv" ){
				codi_for = RetornaCodigoFornecedor($ColunaCodiEmp)
				$2 = int($2) + codi_for
			}
			else
				$2 = $2
			
			print $0 > ArquivoSaida1 
		} else
			print $0 > ArquivoSaida2 #gero os arquivo de entrada para as empresas nao selecionadas
	}
}
