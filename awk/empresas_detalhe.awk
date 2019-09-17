BEGIN{
	FS = ";";
	OFS = FS;
	
	print "codi_emp", "fantasia_emp", "ende_emp", "nume_emp", "bair_emp", "email_emp", "cepe_emp", "comp_emp", "tipo_end_emp", "uefi_emp", "ucta_emp", "dddf_emp", "fone_emp", 
	      "fax_emp"
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	codi_emp = Campo("CODEMP")
	codi_emp = soNumeros(codi_emp)
	codi_emp = FormataCampo("integer", codi_emp, 15, 0)
	
	fantasia_emp = Campo("NOMFANEMP")
	fantasia_emp = Trim(fantasia_emp)
	fantasia_emp = subsCharEspecial(fantasia_emp)
	fantasia_emp = upperCase(fantasia_emp)
	
	ende_emp = Campo("LGREMP")
	ende_emp = Trim(ende_emp)
	ende_emp = subsCharEspecial(ende_emp)
	ende_emp = upperCase(ende_emp)
	
	tp_rua_2 = tpEndereco(ende_emp)
	
	nume_emp = Campo("NUMEMP")
	nume_emp = soNumeros(nume_emp)
	nume_emp = FormataCampo("integer", nume_emp, 15, 0)
	
	bair_emp = Campo("BAIEMP")
	bair_emp = Trim(bair_emp)
	bair_emp = subsCharEspecial(bair_emp)
	bair_emp = upperCase(bair_emp)
	
	email_emp = Campo("EMAEMP")
	email_emp = Trim(email_emp)
	email_emp = tolower(email_emp)
	
	cepe_emp = Campo("CEPEMP")
	cepe_emp = soNumeros(cepe_emp)
		
	comp_emp = Campo("COMEMP")
	comp_emp = Trim(comp_emp)
	comp_emp = subsCharEspecial(comp_emp)
	comp_emp = upperCase(comp_emp)
	
	tp_rua = Campo("CODTIPLOG")
	tp_rua = soNumeros(tp_rua)
	tp_rua = tpEnderecoTron(tp_rua)
	if(tp_rua == "NULO")
		tp_rua = tp_rua_2
	else
		tp_rua = tp_rua
	
	uefi_emp = Campo("UEFI_EMP")
	uefi_emp = soNumeros(uefi_emp)
	if(uefi_emp == "")
		uefi_emp = 0
	else
		uefi_emp = uefi_emp
	
	ucta_emp = Campo("UCTA_EMP")
	ucta_emp = soNumeros(ucta_emp)
	if(ucta_emp == "")
		ucta_emp = 0
	else
		ucta_emp = ucta_emp
	
	telefone = Campo("TELEFONE_EMP")
	telefone = soNumeros(telefone)
	
	fone_emp = tFone(telefone)
	fone_emp = noveCelular(fone_emp)
	
	ddd_emp = Campo("DDD_EMP")
	ddd_emp = soNumeros(ddd_emp)
	ddd_emp = isNull(ddd_emp)
	if(ddd_emp == "NULO" && fone_emp != "NULO")
		ddd_emp = 62
	else
		ddd_emp = ddd_emp
	
	fax = fone_emp # Ddd_Fone(ddd_emp, fone_emp)
	
	print codi_emp, fantasia_emp, ende_emp, nume_emp, bair_emp, email_emp, cepe_emp, comp_emp, tp_rua, uefi_emp, ucta_emp, ddd_emp, fone_emp, fax
}