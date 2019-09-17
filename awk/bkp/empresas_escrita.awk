BEGIN { 
	FS = ""; 
	OFS = ";";
}
{
	if (substr($0,1,9) == "CODEMPESC") {
		selecionaColunas()
		next
	}
	if (substr($0,1,6) == "======")
		next
	
	codi_emp_esc = retornaColuna("CODEMPESC")
	codi_emp_esc = soNumeros(codi_emp_esc)
	codi_emp_esc = FormataCampo("integer", codi_emp_esc, 15)
	
	print codi_emp_esc, "", "", ""
}