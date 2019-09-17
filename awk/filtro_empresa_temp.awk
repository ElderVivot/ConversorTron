BEGIN{
	FS = ";";
	OFS = FS;
}
{
	codi_emp = $1
	codi_emp = Trim(codi_emp)
	
	converter = $4
	converter = Trim(converter)
	converter = upperCase(converter)
	
	converter_numero = codi_emp
	converter_numero = FormataCampo("integer", converter_numero, 15, 0)
	
	#codi_emp = IfElse( codi_emp == 16, 80790, codi_emp )
	
	#if( (codi_emp != "") && (converter == "S" || converter == "" ) )
	#	print codi_emp, codi_emp
	#else if( codi_emp != "" && converter == "N" )
	#	print codi_emp, $2, $3 > "..\\temp\\relacao_empresas_nao_converter.txt"
	if( codi_emp != "" && int(converter_numero) > 0 )
		print codi_emp, converter_numero
	else
		nulo = ""
}