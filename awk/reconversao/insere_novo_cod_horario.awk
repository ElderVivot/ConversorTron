BEGIN {
	FS = ";";
	OFS = FS;
	
	seq = 1;
	seq_2 = 1;
	seq_3 = 1;
}
{
	# ARQUIVO DO CODIGO MAXIMO DO HORARIO DA EMPRESA
	if ( FILENAME == ARGV[1] ) {
		
		codi_emp = $1
		codigo_maximo = $2
		vetor_cod_max[codi_emp] = codigo_maximo
		
	} 
	# FOHORARIOS
	else if ( FILENAME == ARGV[2] ) {
		
		emp = $1
		
		if( emp != emp_ant )
			seq = 1
		else
			seq++
		
		i_horario_antigo = $2
		
		i_horario_novo = int( vetor_cod_max[emp] ) + seq
		$2 = i_horario_novo
		
		vetor_novo_codigo[ emp "-" i_horario_antigo ] = i_horario_novo
		
		print $0 > "..\\prontos\\reconversao\\fohorarios.csv"
		
		emp_ant = emp
	}
	# FOJORNADAS_HORARIOS
	else if ( FILENAME == ARGV[3] ) {
		
		emp_2 = $1
		
		i_horario_antigo_2 = $5
		
		$5 = vetor_novo_codigo[ emp_2 "-" i_horario_antigo_2 ]
		
		print $0 > "..\\prontos\\reconversao\\fojornadas_horarios.csv"
		
	}
	# FOHORARIOS_INTERVALOS
	else {
		
		emp_3 = $1
		
		i_horario_antigo_3 = $2
		
		$2 = vetor_novo_codigo[ emp_3 "-" i_horario_antigo_3 ]
		
		print $0 > "..\\prontos\\reconversao\\fohorarios_intervalos.csv"
		
	}
}