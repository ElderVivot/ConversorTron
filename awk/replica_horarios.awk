BEGIN { 
	FS = ";"; 
	OFS = FS;
	h = 1;
}
{
	if (FILENAME == ARGV[1]) # temp\horas_semana02
		horarios[h++] = $0
	else {
		
		codi_emp = $1
		for (i = 1; i < h; i++) {
			print codi_emp, horarios[i]
		}
		
	}
}