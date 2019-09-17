BEGIN{ 
	FS = ";"; 
	OFS = FS;
	sem_uso = "NULO";
}
{
	if(FNR == 1){
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	codi_con = Campo("CODECT")
	codi_con = soNumeros(codi_con)
	codi_con = int(codi_con) + 1
	
	nome_con = Campo("NOMECT")
	nome_con = Trim(nome_con)
	nome_con = upperCase(nome_con)
	
	cpfc_con = Campo("CPFCTB")
	cpfc_con = soNumeros(cpfc_con)
	if( int( cpfc_con ) == 0 ){
		cpfc_con = Campo("INSECT")
		cpfc_con = soNumeros(cpfc_con)
	}
	else
		cpfc_con = cpfc_con
	
	tins_con = IfElse( length(cpfc_con) == 11, 2, 1)
	
	categoria_con ="C"
	
	telefone = Campo("TELECT")
	telefone = soNumeros(telefone)
	
	fone_con = tFone(telefone)
	fone_con = noveCelular(fone_con)
	
	dddf_con = dddFone(telefone)
	if(dddf_con == "NULO" && fone_con != "NULO")
		dddf_con = 62
	else
		dddf_con = dddf_con
	
	faxe_con = fone_con
	
	cepe_con = Campo("CEPECT")
	cepe_con = soNumeros(cepe_con)
	
	email_con = Campo("EMAECT")
	email_con = Trim(email_con)
	email_con = tolower(email_con)
	
	tpende_con = Campo("TIPO_ENDE")
	tpende_con = Trim(tpende_con)
	tpende_con = upperCase(tpende_con)
	tpende_con = IfElse( tpende_con == "NULO", "", tpende_con " " )
	
	ende_con = Campo("LOGECT")
	ende_con = Trim(ende_con)
	ende_con = tpende_con upperCase(ende_con)
	
	bair_con = Campo("BAIECT")
	bair_con = Trim(bair_con)
	bair_con = upperCase(bair_con)
	
	codigo_municipio = Campo("CODCID")
	codigo_municipio = soNumeros(codigo_municipio)
	codigo_municipio = RetornaCodigoMunicipio(codigo_municipio, "GO", 0, 1)
	codigo_municipio = IfElse( codigo_municipio == "NULO", 977, codigo_municipio )
	
	ufed_con = RetornaUFMunicipio(codigo_municipio)
	
	rcrc_con = Campo("CRCECT")
	rcrc_con = Trim(rcrc_con)
	rcrc_con = upperCase(rcrc_con)
	
	complemento = Campo("COMENDECT")
	complemento = Trim(complemento)
	complemento = upperCase(complemento)
	
	nume_con = Campo("NUMLOGECT")
	nume_con = soNumeros(nume_con)
	nume_con = int(nume_con)
	nume_con = IfElse( nume_con == 0, "NULO", nume_con )
	
	uf_crc = Campo("CODUNDFEDCRCCTB")
	uf_crc = Trim(uf_crc)
	uf_crc = upperCase(uf_crc)
	
	cnpj = Campo("INSECT")
	cnpj = soNumeros(cnpj)
	cnpj = IfElse( length(cnpj) == 11, "NULO", cnpj )
	
	identidade = Campo("IDEECT")
	identidade = Trim(identidade)
	identidade = upperCase(identidade)
	
	orgao_exp_ident = Campo("ORGEXPECT")
	orgao_exp_ident = Trim(orgao_exp_ident)
	
	uf_exp_ident = RetornaUFCampo(orgao_exp_ident)
	
	org_exp_ident = RetornaCampoSemUF(orgao_exp_ident)
	
	data_validade_crc = Campo("VALCRC")
	data_validade_crc = Trim(data_validade_crc)
	data_validade_crc = FormatDate(data_validade_crc, "-", "US")
	data_validade_crc = isDate(data_validade_crc)
	
	# DADOS QUE NAO SERAO BUSCADOS DA DEXION
	cida_con = sem_uso
	cmun_con = sem_uso
	email_con = sem_uso
	cfdf_con = sem_uso
	origem_reg = 1
	cmunrais_con = sem_uso
	data_exp_ident = sem_uso
	matricula = sem_uso
	certificado_digital = sem_uso
	acesso_portal_sefaz = "N"
	tipo_pessoa_portal_sefaz = sem_uso
	senha_portal_sefaz = sem_uso
	tipo_crc_serfaz = sem_uso
	arquivo_certificado_digital = sem_uso
	razao_social = ""
	crc_escritorio = sem_uso
	certificado_digital_a3 = "N"
	responsavel_legal_empresa_junto_base_rfb = "N"
	sequencial_crc = sem_uso
	
	print codi_con, nome_con, rcrc_con, cpfc_con, ende_con, nume_con, bair_con, cida_con, cmun_con, cepe_con, ufed_con, fone_con, dddf_con, faxe_con, email_con,
	      cfdf_con, tins_con, categoria_con, origem_reg, cmunrais_con, codigo_municipio, cnpj, identidade, data_exp_ident, org_exp_ident, uf_exp_ident, matricula,
		  certificado_digital, complemento, uf_crc, acesso_portal_sefaz, tipo_pessoa_portal_sefaz, senha_portal_sefaz, tipo_crc_serfaz, data_validade_crc,
		  sequencial_crc, arquivo_certificado_digital, razao_social, crc_escritorio, certificado_digital_a3, responsavel_legal_empresa_junto_base_rfb, contabilista
}