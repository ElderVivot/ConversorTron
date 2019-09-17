BEGIN { 
	FS = ";"; 
	OFS = FS; 
}
{
	if (FILENAME == ARGV[1]) {
		i = $1
		ind[i] = i
		reg[i] = $0
	} else {
		emp = $1
		if (ind[emp] != "")
			print $0, reg[emp]
		else {
			campos = NF
			for (i = 1; i <= 16; i++) { 
				$(campos + i) = "NULO" 
			}
			print $0
		}
	}
}