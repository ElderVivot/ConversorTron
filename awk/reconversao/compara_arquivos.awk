BEGIN {
	FS = ";";
	OFS = FS;
	
	# SE PASTA = 0 ENTAO VAI SALVAR NA PASTA TEMP, SE IGUAL A 1 VAI SALVAR NA PASTA PRONTOS
	temp_prontos_true = IfElse( pasta_true == 1, "prontos", "temp" );
	temp_prontos_false = IfElse( pasta_false == 1, "prontos", "temp" );
	
	# SE PASTA = 0 ENTAO INFORMA SE TRUE OU FALSE, SE IGUAL A 1 SOH IMPRIME O NOME DO ARQUIVO
	apos_nome_true = IfElse( pasta_true == 1, "", "_true" );
	apos_nome_false = IfElse( pasta_false == 1, "", "_false" );
	
	# VINCULA ONDE OS ARQUIVOS SERAO SALVOS E QUAL SEU NOME
	arquivo_true = "..\\" temp_prontos_true "\\reconversao\\" arquivo "" apos_nome_true ".csv";
	arquivo_false = "..\\" temp_prontos_false "\\reconversao\\" arquivo "" apos_nome_false ".csv";
}
{
	# DADOS QUE JAH EXISTE NA DOMINIO
	if ( FILENAME == ARGV[1] ) {
		
		i = $1 "-" $2
		ind[i] = i
		
	} 
	# DADOS GERAL DO ARQUIVO GERADO
	else {
		
		o = $1 "-" $2
		
		if( ind[o] != "" )  
			print $0 > arquivo_true
		else
			print $0 > arquivo_false
	
	}	
}