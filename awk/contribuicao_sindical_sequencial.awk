BEGIN { 
	FS = ";" ; 
	OFS = FS;
	seq = 1
}
{
	i = $1 "-" $2
	if(i == i_ant)
		print $0, seq++
	else{
		seq = 1
		print $0, seq++
	}
	i_ant = i
}