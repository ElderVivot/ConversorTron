BEGIN { 
	FS = ";";
	OFS = FS; 
	
	print "codi_emp", "cpf_leg_emp", "rleg_emp", "end_leg_emp", "nume_leg_emp", "bair_leg_emp", "mun_leg_emp", "uf_leg_emp", "cep_leg_emp", "profissao_leg_emp", 
	      "email_leg_emp", "rg_resp_emp", "orgao_emissor_leg_emp", "uf_emissao_resp", "dddf_leg_emp", "fone_leg_emp"
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	codi_emp = Campo("CODEMP")
	codi_emp = soNumeros(codi_emp)
	
	rleg_emp = Campo("NOMSCORSP")
	rleg_emp = Trim(rleg_emp)
	rleg_emp = subsCharEspecial(rleg_emp)
	rleg_emp = upperCase(rleg_emp)
	
	cpf_leg_emp = Campo("INSSCORSP")
	cpf_leg_emp = soNumeros(cpf_leg_emp)
	
	rg_resp_emp = Campo("IDESCORSP")
	rg_resp_emp = Trim(rg_resp_emp)
	
	end_leg_emp = Campo("LGRSCORSP")
	end_leg_emp = Trim(end_leg_emp)
	end_leg_emp = subsCharEspecial(end_leg_emp)
	end_leg_emp = upperCase(end_leg_emp)
	
	nume_leg_emp = Campo("NUMSCORSP")
	nume_leg_emp = soNumeros(nume_leg_emp)
	
	bair_leg_emp = Campo("BAISCORSP")
	bair_leg_emp = Trim(bair_leg_emp)
	bair_leg_emp = subsCharEspecial(bair_leg_emp)
	bair_leg_emp = upperCase(bair_leg_emp)
	
	cep_leg_emp = Campo("CEPSCORSP")
	cep_leg_emp = soNumeros(cep_leg_emp)
	
	email_leg_emp = Campo("EMASCORSP")
	email_leg_emp = Trim(email_leg_emp)
	email_leg_emp = tolower(email_leg_emp)
	
	mun_leg_emp = Campo("CODCID")
	mun_leg_emp = soNumeros(mun_leg_emp)
	mun_leg_emp = RetornaNomeMunicipio(mun_leg_emp)
	
	uf_leg_emp = Campo("CODCID")
	uf_leg_emp = soNumeros(uf_leg_emp)
	uf_leg_emp = RetornaCodigoMunicipio(uf_leg_emp, "", 0, 1)
	uf_leg_emp = RetornaUFMunicipio(uf_leg_emp)
	
	cargo_leg_emp = Campo("DESCCAR")
	cargo_leg_emp = Trim(cargo_leg_emp)
	
	orgao_exp_ident = Campo("ORGEXPSCORSP")
	orgao_exp_ident = Trim(orgao_exp_ident)
	
	uf_emissor_rg = RetornaUFCampo(orgao_exp_ident)
	
	orgao_rg = RetornaCampoSemUF(orgao_exp_ident)
	
	telefone = Campo("TELSCORSP")
	telefone = soNumeros(telefone)
	
	fone = tFone(telefone)
	fone = noveCelular(fone)
	
	ddd_fone = dddFone(telefone)
	if(ddd_fone == "NULO" && fone != "NULO")
		ddd_fone = 62
	else
		ddd_fone = ddd_fone
	
	
	print codi_emp, cpf_leg_emp, rleg_emp, end_leg_emp, nume_leg_emp, bair_leg_emp, mun_leg_emp, uf_leg_emp, cep_leg_emp, cargo_leg_emp, 
	      email_leg_emp, rg_resp_emp, orgao_rg, uf_emissor_rg, ddd_fone, fone
	
}