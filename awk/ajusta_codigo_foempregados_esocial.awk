BEGIN { 
	ArquivoSaida1 = "..\\prontos\\" Arquivo ".csv"; 
	ArquivoSaida2 = "..\\temp\\" Arquivo "_nao.csv";
	FS = ";";
	OFS = FS;
}
{
	if (FILENAME == ARGV[1]) { #le o relacao_empresas.txt
		i = $1 #codi_emp original
		icod[i] = i #codi_emp original
		inov[i] = $2 #novo_codigo vair receber da coluna 2
	} else { #arquivo de empresas
		
		if (icod[$ColunaCodiEmp] != "") { #codi_emp ($1) != "" entao le
			$ColunaCodiEmp = inov[$ColunaCodiEmp] #$1 vai receber novo_codigo
			
			$5 = $ColunaCodiEmp
			
			print $0 > ArquivoSaida1 #gero o arquivo de entrada para as empresas selecionadas
		} else
			print $0 > ArquivoSaida2 #gero os arquivo de entrada para as empresas nao selecionadas
	}
}
