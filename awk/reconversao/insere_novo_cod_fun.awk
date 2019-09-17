BEGIN {
	FS = ";";
	OFS = FS;
	
	seq = 1;
}
{
	# DADOS QUE JAH EXISTE NA DOMINIO
	if ( FILENAME == ARGV[1] ) {
		
		codi_emp = $1
		codigo_maximo = $2
		vetor_cod_max[codi_emp] = codigo_maximo
		
	} 
	# DADOS GERAL DO ARQUIVO GERADO
	else {
		
		emp = $1
		
		if( emp != emp_ant )
			seq = 1
		else
			seq++
		
		i_empregados_antigo = $2
		
		i_empregados_novo = int( vetor_cod_max[emp] ) + seq
		$2 = i_empregados_novo
		
		# TIRAR AS INSTRUCOES ABAIXO DO IF. USADO PARA UMA CONVERSAO ANTIGA
		if( $232 == 999 )
			$232 = 9999
		if( $43 == 999 )
			$43 = 9999
		
		print emp, i_empregados_antigo, i_empregados_novo > "..\\temp\\reconversao\\empregados_novo_codigo.csv"
		
		print $0
		
		emp_ant = emp
	
	}	
}