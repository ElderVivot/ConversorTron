BEGIN {
	FS = ";"; 
	OFS = FS;
}
{
	sind = $56
	
	if( JaImprimiuSindicato[ sind ] == 0 ){
		
		print sind
		JaImprimiuSindicato[ sind ] = 1
		
	}

}