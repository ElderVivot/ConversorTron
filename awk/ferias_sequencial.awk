BEGIN { 
	FS = ";" ; 
	OFS = FS;
	seq = 1
}
{
	i = $1 "-" $2
	if(i == i_ant){
		$3 = seq++
		print $0
	}
	else{
		seq = 1
		$3 = seq++
		print $0
	}
	i_ant = i
}