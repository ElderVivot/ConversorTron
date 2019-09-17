BEGIN { 
	FS = ";"; 
	OFS = FS;
	
	segunda = 1
	terca = 2
	quarta = 3
	quinta = 4
	sexta = 5
	sabado = 6
	domingo = 7
}
{
	if(FILENAME == ARGV[1]){ # ARQUIVO DE HORARIOS_SEMANA02
		
		i_horarios = $1
		
		dia_semana = $2
		
		linha_horarios[ i_horarios "-" dia_semana ] = $0
		
		vetor_horarios[i_horarios] = i_horarios
		
	}
	else if(FILENAME == ARGV[2]) { # ARQUIVO DE FUNCIONARIOS AUXILIAR
		
		codi_emp = $1
		
		i_horarios_2 = $3
		
		# SOMENTE HORARIOS EXISTENTES
		if( vetor_horarios[i_horarios_2] != "" ){
			
			# SEGUNDA FEIRA
			if( JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" segunda ] == 0 ){
				
				if( linha_horarios[ i_horarios_2 "-" segunda ] != "" )	
					print codi_emp, linha_horarios[ i_horarios_2 "-" segunda ]
			
				JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" segunda ] = 1
			}
			
			# TERCA
			if( JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" terca ] == 0 ){
				
				if( linha_horarios[ i_horarios_2 "-" terca ] != "" )	
					print codi_emp, linha_horarios[ i_horarios_2 "-" terca ]
				
				JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" terca ] = 1
			}
			
			# QUARTA
			if( JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" quarta ] == 0 ){
				
				if( linha_horarios[ i_horarios_2 "-" quarta ] != "" )	
					print codi_emp, linha_horarios[ i_horarios_2 "-" quarta ]
				
				JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" quarta ] = 1
			}
			
			# QUINTA
			if( JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" quinta ] == 0 ){
				
				if( linha_horarios[ i_horarios_2 "-" quinta ] != "" )	
					print codi_emp, linha_horarios[ i_horarios_2 "-" quinta ]
				
				JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" quinta ] = 1
			}
			
			# SEXTA
			if( JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" sexta ] == 0 ){
				
				if( linha_horarios[ i_horarios_2 "-" sexta ] != "" )	
					print codi_emp, linha_horarios[ i_horarios_2 "-" sexta ]
				
				JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" sexta ] = 1
			}
			
			# SABADO
			if( JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" sabado ] == 0 ){
				
				if( linha_horarios[ i_horarios_2 "-" sabado ] != "" )	
					print codi_emp, linha_horarios[ i_horarios_2 "-" sabado ]
				
				JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" sabado ] = 1
			}
			
			# DOMINGO
			if( JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" domingo ] == 0 ){
				
				if( linha_horarios[ i_horarios_2 "-" domingo ] != "" )	
					print codi_emp, linha_horarios[ i_horarios_2 "-" domingo ]
				
				JaImprimiuJornada[ codi_emp "-" i_horarios_2 "-" domingo ] = 1
			}
			
		}
	}
	else{ # ARQUIVO DE TROCA DE HORARIO
	
		if (FNR == 1) {
			for (c = 1; c <= NF; c++)
				Coluna[$c] = c
			next
		}	
 
		codi_emp_2 = Campo("CODEMPFOL")
		codi_emp_2 = soNumeros(codi_emp_2)
		codi_emp_2 = int(codi_emp_2)
		
		i_horarios_3 = Campo("CODHORTRB")
		i_horarios_3 = soNumeros(i_horarios_3)
		i_horarios_3 = int(i_horarios_3)
		
		# SOMENTE HORARIOS EXISTENTES
		if( vetor_horarios[i_horarios_3] != "" ){
			
			# SEGUNDA FEIRA
			if( JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" segunda ] == 0 ){
				
				if( linha_horarios[ i_horarios_3 "-" segunda ] != "" )	
					print codi_emp_2, linha_horarios[ i_horarios_3 "-" segunda ]
			
				JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" segunda ] = 1
			}
			
			# TERCA
			if( JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" terca ] == 0 ){
				
				if( linha_horarios[ i_horarios_3 "-" terca ] != "" )	
					print codi_emp_2, linha_horarios[ i_horarios_3 "-" terca ]
				
				JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" terca ] = 1
			}
			
			# QUARTA
			if( JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" quarta ] == 0 ){
				
				if( linha_horarios[ i_horarios_3 "-" quarta ] != "" )	
					print codi_emp_2, linha_horarios[ i_horarios_3 "-" quarta ]
				
				JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" quarta ] = 1
			}
			
			# QUINTA
			if( JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" quinta ] == 0 ){
				
				if( linha_horarios[ i_horarios_3 "-" quinta ] != "" )	
					print codi_emp_2, linha_horarios[ i_horarios_3 "-" quinta ]
				
				JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" quinta ] = 1
			}
			
			# SEXTA
			if( JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" sexta ] == 0 ){
				
				if( linha_horarios[ i_horarios_3 "-" sexta ] != "" )	
					print codi_emp_2, linha_horarios[ i_horarios_3 "-" sexta ]
				
				JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" sexta ] = 1
			}
			
			# SABADO
			if( JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" sabado ] == 0 ){
				
				if( linha_horarios[ i_horarios_3 "-" sabado ] != "" )	
					print codi_emp_2, linha_horarios[ i_horarios_3 "-" sabado ]
				
				JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" sabado ] = 1
			}
			
			# DOMINGO
			if( JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" domingo ] == 0 ){
				
				if( linha_horarios[ i_horarios_3 "-" domingo ] != "" )	
					print codi_emp_2, linha_horarios[ i_horarios_3 "-" domingo ]
				
				JaImprimiuJornada[ codi_emp_2 "-" i_horarios_3 "-" domingo ] = 1
			}
		}
	}	
}