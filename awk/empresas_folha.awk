BEGIN{
	FS = ";";
	OFS = FS;
	
	print "codi_emp", "codi_fpas", "codigo_gfip", "codi_gps", "ufol_emp", "perc_acid_trabalho", "perc_autonomos", "perc_inss_empresa", "codigo_terceiro", 
	      "perc_terceiro"
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}	
	
	codi_emp_fol = Campo("CODEMPFOL")
	codi_emp_fol = Trim(codi_emp_fol)
	
	ufol_emp = 1
	
	codi_fpas = Campo("CODFPA")
	codi_fpas = Trim(codi_fpas)
	codi_fpas = isNull(codi_fpas)
	codi_fpas = IfElse( codi_fpas == "NULO", 515, codi_fpas )

	codigo_gfip = Campo("CODRECSFP")
	codigo_gfip = soNumeros(codigo_gfip)
	codigo_gfip = FormataCampo("integer", codigo_gfip, 15, 0)
	if ( (codigo_gfip != 115) && (codigo_gfip != 150) && (codigo_gfip != 155) && (codigo_gfip != 211) ) 
		codigo_gfip = 115
	else
		codigo_gfip = codigo_gfip
	
	codi_gps = Campo("CODGPS")
	codi_gps = Trim(codi_gps)
	codi_gps = isNull(codi_gps)
	codi_gps = IfElse( codi_gps == "NULO", 2100, codi_gps )
	
	perc_acid_trabalho = Campo("ALQACITRBEMPFOL")
	perc_acid_trabalho = Trim(perc_acid_trabalho)
	perc_acid_trabalho = FormataCampo("double", perc_acid_trabalho, 5, 3)
	
	perc_autonomos = Campo("ALIINSAUTFPA")
	perc_autonomos = Trim(perc_autonomos)
	perc_autonomos = FormataCampo("double", perc_autonomos, 5, 3)
	
	perc_prob_lab = Campo("ALIINSPROLABFPA")
	perc_prob_lab = Trim(perc_prob_lab)
	perc_prob_lab = FormataCampo("double", perc_prob_lab, 5, 3)
	
	perc_autonomos = IfElse( perc_autonomos == "0.000", perc_prob_lab, perc_autonomos )
	
	perc_inss_empresa = Campo("ALIINSFOLPAGFPA")
	perc_inss_empresa = Trim(perc_inss_empresa)
	perc_inss_empresa = FormataCampo("double", perc_inss_empresa, 5, 3)
	
	codigo_terceiro = Campo("CODTERFPAOUTENT")
	codigo_terceiro = soNumeros(codigo_terceiro)
	codigo_terceiro = isNull(codigo_terceiro)
	codigo_terceiro = IfElse( codigo_terceiro == "NULO", 0, codigo_terceiro )
	
	perc_terceiro = Campo("ALQTERFPAOUTENT")
	perc_terceiro = Trim(perc_terceiro)
	perc_terceiro = FormataCampo("double", perc_terceiro, 5, 3)
	
    print codi_emp_fol, codi_fpas, codigo_gfip, codi_gps, ufol_emp, perc_acid_trabalho, perc_autonomos, perc_inss_empresa, codigo_terceiro, perc_terceiro

}