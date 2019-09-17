BEGIN{
	FS = ";";
	OFS = FS;
	codi_cli_for = 1 # OS DOIS PRIMEIROS JAH EXISTEM CADASTRADOS
	sem_uso = "NULO"
	codi_cta = sem_uso
	cida_cli_for = sem_uso
	agro_cli_for = "N"
	icms_cli_for = "S"
	aliq_cli_for = sem_uso
	origem_reg = 1
	categoria_estabel_cli_for = sem_uso
	regime_cli_for = "O"
	orgao_pub_federal_cli_for = sem_uso
	codigo_pais = 30
	codm_cli_for = sem_uso
	insc_suframa = sem_uso
	cadastro_cli_for = sem_uso # VOU AVALIAR PRA IMPLEMENTAR NO PROXIMO DATA_INICIO.AWK
	conta_for_cli = sem_uso
	tipo_assinante_cli_for = sem_uso
	possui_interdependencia_cli_for = "N"
	iestst_cli_for = sem_uso
	agente_regulado_cli_for = "N"
	codigo_instalacao_cli_for = ""
	participante_fome_zero = "N"
	percentual_carga_media = "0.00"
	varejista_ou_consumidor_final_cli_for = "N"
	conta_compensacao_cli_for = sem_uso
	insc_prog_aquisicao_alimentos = "N"
	possui_nif = sem_uso
	nif = ""
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
	
	if( codi_emp == codi_emp_ant )
		codi_cli_for++
	else
		codi_cli_for = 1
	
	codi_emp_ant = codi_emp
	
	nome_emp = Campo("RAZSOCEMP")
	nome_emp = Trim(nome_emp)
	nome_emp = subsCharEspecial(nome_emp)
	nome_emp = upperCase(nome_emp)
	
	fantasia_emp = Campo("NOMFANEMP")
	fantasia_emp = Trim(fantasia_emp)
	fantasia_emp = subsCharEspecial(fantasia_emp)
	fantasia_emp = upperCase(fantasia_emp)
	
	if( fantasia_emp == "NULO" || fantasia_emp == "" )
		fantasia_emp = substr( nome_emp, 1, 10 )
	else
		fantasia_emp = fantasia_emp
	
	ende_emp = Campo("LGREMP")
	ende_emp = Trim(ende_emp)
	ende_emp = subsCharEspecial(ende_emp)
	ende_emp = upperCase(ende_emp)
	
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
	
	fax = Ddd_Fone(ddd_emp, fone_emp)
	
	cgc = Campo("INSEMP")	
	cgc = soNumeros(cgc)
	
	tipo_ins = tpInscricao(cgc)
	
	# IBGE/RAIS
	cod_cidade = Campo("CODCID")
	cod_cidade = soNumeros(cod_cidade)
	cod_cidade = RetornaCodigoMunicipio(cod_cidade, "GO", 1, 1)
	
	esta_emp = RetornaUFMunicipio(cod_cidade)
	
	nat_jur = Campo("CODNATJUR")
	nat_jur = soNumeros(nat_jur)
	nat_jur = RetornaNatJur(nat_jur)
	
	ins_mun = Campo("INSMUNEMP")
	ins_mun = Trim(ins_mun)
	ins_mun = upperCase(ins_mun)
	ins_mun = isNull(ins_mun)
	
	ins_est = Campo("INSESTEMP")
	ins_est = Trim(ins_est)
	ins_est = upperCase(ins_est)
	ins_est = isNull(ins_est)
	
	i_cnae20 = Campo("CODCLSATVCNADOI")
	i_cnae20 = soNumeros(i_cnae20)
	if(length(i_cnae20) < 7){
		i_cnae20 = Campo("CODSUBCLSATVCNADOI")
		i_cnae20 = soNumeros(i_cnae20)   
	}
	i_cnae20 = RetornaCodigoCnae20(i_cnae20)
	
	print codi_emp, codi_cli_for, esta_emp, codi_cta, codm_cli_for, fantasia_emp, nome_emp, ende_emp, nume_emp, cida_cli_for, cepe_emp, cgc, ins_est, fone_emp, fax,
	      agro_cli_for, icms_cli_for, tipo_ins, ddd_emp, ins_mun, bair_emp, origem_reg, categoria_estabel_cli_for, iestst_cli_for, email_emp, regime_cli_for, codigo_pais,
		  cod_cidade, insc_suframa, comp_emp, cadastro_cli_for, conta_for_cli, tipo_assinante_cli_for, possui_interdependencia_cli_for, agente_regulado_cli_for, 
		  codigo_instalacao_cli_for, participante_fome_zero, insc_prog_aquisicao_alimentos, i_cnae20, possui_nif, nif, varejista_ou_consumidor_final_cli_for,
		  conta_compensacao_cli_for
}