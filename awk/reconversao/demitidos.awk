BEGIN {
	FS = ";";
	OFS = FS;
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
		
		if( novo_codigo[ $1 "-" $2 ] != "" ){
			$2 = novo_codigo[ $1 "-" $2 ]
			print $0
		}
	
	}	
}