BEGIN{
	FS = ";";
	OFS = FS;
	
	print "codi_emp", "nome_emp", "tins_emp", "cgce_emp", "dtinicio_emp", "codigo_municipio", "esta_emp", "njud_emp", "imun_emp", "iest_emp", "ijuc_emp", "djuc_emp",
	      "cnae_emp", "i_cnae20", "stat_emp", "ramo_emp", "codi_con"
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
		
	codi_emp = Campo("CODEMP")
	codi_emp = soNumeros(codi_emp)
	
	nome_emp = Campo("RAZSOCEMP")
	nome_emp = Trim(nome_emp)
	nome_emp = subsCharEspecial(nome_emp)
	nome_emp = upperCase(nome_emp)
	
	tipo_ins = Campo("TIPINSEMP")
	tipo_ins = soNumeros(tipo_ins)
	if(tipo_ins == 3)
	   tipo_ins = 2
	else if(tipo_ins == 2)
	   tipo_ins = 3
	else
		tipo_ins = 1
	
	cgc = Campo("INSEMP")	
	cgc = soNumeros(cgc)
	
	dt_initv = Campo("DTAINIATVEMP")
	dt_initv = Trim(dt_initv)
	dt_initv = FormatDate(dt_initv, "-", "US")
	dt_initv = isDate(dt_initv)
	
	# IBGE/RAIS
	cod_cidade = Campo("CODCID")
	cod_cidade = soNumeros(cod_cidade)
	cod_cidade = RetornaCodigoMunicipio(cod_cidade, "", 0, 1)
	
	esta_emp = RetornaUFMunicipio(cod_cidade)
	
	nat_jur = Campo("CODNATJUR")
	nat_jur = soNumeros(nat_jur)
	nat_jur = RetornaNatJur(nat_jur)
	
	ins_mun = Campo("INSMUNEMP")
	ins_mun = Trim(ins_mun)
	ins_mun = upperCase(ins_mun)
	if(ins_mun == 0)
		ins_mun = "NULO"
	else
		ins_mun = ins_mun
	
	ins_est = Campo("INSESTEMP")
	ins_est = Trim(ins_est)
	ins_est = upperCase(ins_est)
	if(ins_est == 0)
		ins_est = "NULO"
	else
		ins_est = ins_est
	
	junta_comer = Campo("JUNCOMEMP")
	junta_comer = soNumeros(junta_comer)
	
	dt_regjuncom = Campo("DTAREGJUNCOMEMP")
	dt_regjuncom = Trim(dt_regjuncom)
	dt_regjuncom = FormatDate(dt_regjuncom, "-", "US")
	dt_regjuncom = isDate(dt_regjuncom)
	
	cnae_emp = Campo("CODSUBCLAATV")
	cnae_emp = soNumeros(cnae_emp)
	
	i_cnae20 = Campo("CODCLSATVCNADOI")
	i_cnae20 = soNumeros(i_cnae20)
	if(length(i_cnae20) < 7){
		i_cnae20 = Campo("CODSUBCLSATVCNADOI")
		i_cnae20 = soNumeros(i_cnae20)   
	}
	i_cnae20 = RetornaCodigoCnae20(i_cnae20)
	
	ramo_emp = RetornaNomeCnae20(i_cnae20)
	
	dt_inatividade = Campo("DTAINAEMP")
	dt_inatividade = Trim(dt_inatividade)
	dt_inatividade = FormatDate(dt_inatividade, "-", "US")
	dt_inatividade = isDate(dt_inatividade)
	
	#stat_emp = IfElse( dt_inatividade == "NULO", "A", "I" )
	
	stat_emp = Campo("STSEMP")
	stat_emp = Trim(stat_emp)
	stat_emp = upperCase(stat_emp)
	stat_emp = IfElse( stat_emp == "I", "I", "A" )
	
	codi_con = Campo("CODECT")
	codi_con = soNumeros(codi_con)
	codi_con = int(codi_con) + 1
	
	print codi_emp, nome_emp, tipo_ins, cgc, dt_initv, cod_cidade, esta_emp, nat_jur, ins_mun, ins_est, junta_comer, dt_regjuncom, cnae_emp, i_cnae20, stat_emp, ramo_emp, codi_con
}