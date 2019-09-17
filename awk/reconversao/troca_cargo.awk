BEGIN {
	FS = ";";
	OFS = FS;
	data_conversao_original = substr(data_conversao_orig, 7, 4) "" substr(data_conversao_orig, 4, 2) "" substr(data_conversao_orig, 1, 2);
}
{
	# DADOS QUE JAH EXISTE NA DOMINIO
	if ( FILENAME == ARGV[1] ) {
		
		codi_emp = $1
		i_empregados_antigo = $2
		i_empregados_novo = $3
		novo_codigo[ codi_emp "-" i_empregados_antigo ] = i_empregados_novo
		
	} 
	# DADOS GERAL DO ARQUIVO GERADO
	else {
		
		data_troca_int = substr($4, 7, 4) "" substr($4, 4, 2) "" substr($4, 1, 2)
		
		if( int(data_troca_int) > int(data_conversao_original) ){
			if( novo_codigo[ $1 "-" $2 ] != "" ){
				$2 = novo_codigo[ $1 "-" $2 ]
				print $0
			}
		}
	
	}	
}