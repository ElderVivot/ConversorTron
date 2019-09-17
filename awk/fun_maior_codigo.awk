BEGIN { 
	FS = ";"; 
	OFS = FS; 
}
{
	if( FILENAME == ARGV[2] ){
		codi_emp = int($1)
		i_empregados = int($2)
		
		emp[codi_emp] = codi_emp	
		fun[codi_emp] = i_empregados

		if ( fun[codi_emp] >= maior_codigo_fun[codi_emp] )
			maior_codigo_fun[codi_emp] = fun[codi_emp]
	}
}
END {
	while ( (getline < ARGV[1]) > 0 ) {
		codi_emp = int($1)
		if (codi_emp >= maior_codigo_emp)
			maior_codigo_emp = codi_emp
		emp[codi_emp] = codi_emp
	}
	for ( x = 1; x <= maior_codigo_emp; x++) {
		if (emp[x] != ""){
			
			if( maior_codigo_fun[x] == "" )
				maior_codigo_fun[x] = 0
			else
				maior_codigo_fun[x] = maior_codigo_fun[x]
				
			print emp[x], maior_codigo_fun[x]
		}
	}
}