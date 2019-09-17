BEGIN{
	FS = ";";
	
	# --------- CNAE 2.0 --------------
	ArquivoCnae20 = "..\\awk\\GECNAE20.txt"
	while((getline < ArquivoCnae20) > 0){
		cod_cnae20 = $1
		nome_cnae20 = $2
		
		# Cria o vertor que vai receber o código do cnae
		CodCnae20[cod_cnae20] = cod_cnae20
		NomeCnae20_v[cod_cnae20] = nome_cnae20
	} close(ArquivoCnae20)
	
	# --------- NATUREZA JURIDICA --------------
	ArquivoNatJur = "..\\awk\\GENATJURIDICA.txt"
	while((getline < ArquivoNatJur) > 0){
		cod_natjur = $1
		
		# Cria o vertor que vai receber o código da natureza juridica
		CodNatJur[cod_natjur] = cod_natjur
	} close(ArquivoNatJur)
	
	# --------- EMPRESAS --------------
	ArquivEmpresas = "..\\dados\\auxiliar_cli_for.csv"
	while((getline < ArquivEmpresas) > 0){
		codi_emp_carrega = $1
		data_inicio = $2
		codi_cli_carrega = $3
		codi_for_carrega = $4
		
		# Cria o vertor que vai receber o código da natureza juridica
		DataInicio[codi_emp_carrega] = data_inicio
		CodigoCliente[codi_emp_carrega] = codi_cli_carrega
		CodigoFornecedor[codi_emp_carrega] = codi_for_carrega
	} close(ArquivEmpresas)
	
	# --------- CNAE ESOCIAL --------------
	ArquivoCnaeEsocial = "..\\awk\\GECNAE_PREVIDENCIA_SOCIAL.txt"
	while((getline < ArquivoCnaeEsocial) > 0){
		cod_cnae_esocial = $1
		
		# Cria o vertor que vai receber o código do cnae
		CodCnaeEsocial[cod_cnae_esocial] = cod_cnae_esocial
	} close(ArquivoCnaeEsocial)
	
}

# RETORNA CÓDIGO DO CNAE 2.0
function RetornaCodigoCnae20(argCnae20){
	
	CodigoCnae20 = "NULO"
	IndiceCnae20 = argCnae20
	
	if(CodCnae20[IndiceCnae20] != "")
		CodigoCnae20 = CodCnae20[IndiceCnae20]
	else
		CodigoCnae20 = "NULO"
	
	return CodigoCnae20
}

# RETORNA NOME DO CNAE 2.0
function RetornaNomeCnae20(argCnae20){
	
	NomeCnae20 = "NULO"
	IndiceCnae20 = argCnae20
	
	if(NomeCnae20_v[IndiceCnae20] != "")
		NomeCnae20 = NomeCnae20_v[IndiceCnae20]
	else
		NomeCnae20 = "NULO"
	
	return NomeCnae20
}

# RETORNA CÓDIGO DA NATUREZA JURIDICA
function RetornaNatJur(argNatJur){
	
	CodigoNatJur = "NULO"
	IndiceNatJur = argNatJur
	
	if(CodNatJur[IndiceNatJur] != "")
		CodigoNatJur = CodNatJur[IndiceNatJur]
	else
		CodigoNatJur = "NULO"
	
	return CodigoNatJur
}

# RETORNA DATA INICIO EMPRESA
function RetornaDataInicio(argCodiEmp){
	
	data_inicio_function = ""
	
	codi_emp_function = ""
	codi_emp_function = argCodiEmp
	
	if( DataInicio[codi_emp_function] != "" )
		data_inicio_function = DataInicio[codi_emp_function]
	else
		data_inicio_function = "NULO"
	
	return data_inicio_function
}

# RETORNA CÓDIGO DO CLIENTE
function RetornaCodigoCliente(argCodiEmp){
	
	codi_cli_function = ""
	
	codi_emp_function = ""
	codi_emp_function = argCodiEmp
	
	if( CodigoCliente[codi_emp_function] != "" )
		codi_cli_function = CodigoCliente[codi_emp_function]
	else
		codi_cli_function = 0
	
	return codi_cli_function
}

# RETORNA CÓDIGO DO FORNECEDOR
function RetornaCodigoFornecedor(argCodiEmp){
	
	codi_for_function = ""
	
	codi_emp_function = ""
	codi_emp_function = argCodiEmp
	
	if( CodigoFornecedor[codi_emp_function] != "" )
		codi_for_function = CodigoFornecedor[codi_emp_function]
	else
		codi_for_function = 0
	
	return codi_for_function
}

# RETORNA CÓDIGO DO CNAE ESOCIAL
function RetornaCodigoCnaeEsocial(argCnaeEsocial){
	
	CodigoCnaeEsocial = "NULO"
	IndiceCnaeEsocial = argCnaeEsocial
	
	if(CodCnaeEsocial[IndiceCnaeEsocial] != "")
		CodigoCnaeEsocial = CodCnaeEsocial[IndiceCnaeEsocial]
	else
		CodigoCnaeEsocial = "NULO"
	
	return CodigoCnaeEsocial
}