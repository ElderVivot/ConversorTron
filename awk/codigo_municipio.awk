BEGIN{
	FS = ";";
	
	# -------- MUNICIPIOS - CIDADES ------------
	ArquivoMunicipios = "..\\awk\\GEMUNICIPIOS.txt"
	while ((getline < ArquivoMunicipios) > 0) {
		codigo_municipio = $1
		uf_municipio = $2
		nome_municipio = $3
		ibgerais = $5
		
		# Cria o índice que irá receber o código do município usando cidade e estado
		CodMun[uf_municipio "-" nome_municipio] = codigo_municipio
		
		#Cria o índice usando somente a cidade
		CodMun_2[nome_municipio] = codigo_municipio
		
		#Cria o índice usando o código IBGE/RAIS
		CodMun_IBGE[ibgerais] = codigo_municipio
		
		NomeMun_IBGE[ibgerais] = nome_municipio
		
		UFMun_Codigo[codigo_municipio] = uf_municipio
		
		#OFS = FS;
		#print ibgerais, CodMun_IBGE[ibgerais] > "..\\temp\\teste_municipio.txt"
		
	} close(ArquivoMunicipios)
}

#RETORNA CODIGO DO MUNICIPIO COMPARANDO O NOME E ESTADO
function RetornaCodigoMunicipio(argCidade, argEstado, argCapital, argInformado) {
	# argInformado = 0 --> NOME DA CIDADES
	# argInformado = 1 --> IBGE/RAIS
	
	CodigoMunicipio = "NULO"
	
	IndiceMun = ""
	IndiceMun_2 = ""
	IndiceMun_IBGE = ""
	
	# COLOCA A CIDADE NULA PRA NAO TER PROBLEMA DE RETORNAR ERRADO ACASO O MUNICIPIO NAO TIVER CODIGO IBGE (EX MOJOUI CAMPOS)
	if (argCidade == "" || argCidade == "NULO") 
		argCidade = "NULO"
	else
		argCidade = argCidade
	
	# Se não tiver Estado retorna "NULO"
	if (argEstado == "") 
		argEstado = "NULO"
	else
		argEstado = argEstado
	
	# Se o parâmetro Capital não for informado, seta como "0" (Não gerar Capital)
	if (argCapital == "") 
		argCapital = 0
	else
		argCapital = argCapital
	
	# Se o parâmetro da informação não for passada vai considerar como se fosse o nome
	if ( (argInformado != 0) && (argInformado != 1) )
		argInformado = 0
	else
		argInformado = argInformado
		
	# Cria um índice a partir usando a Cidade e Estado
	IndiceMun = toupper(argEstado) "-" toupper(argCidade)
	
	# Cria um índice usando somente a Cidade
	IndiceMun_2 = toupper(argCidade)
	
	# Cria um índice usando código IBGE/RAIS
	IndiceMun_IBGE = argCidade
	
	if ( (argInformado == 0) && (CodMun[IndiceMun] != "") )  
		CodigoMunicipio = CodMun[IndiceMun]
	else if( (argInformado == 0) && (CodMun_2[IndiceMun_2] != "") && (CodMun[IndiceMun] == "") )
		CodigoMunicipio = CodMun_2[IndiceMun_2]
	else if( (argInformado == 1) && ( CodMun_IBGE[IndiceMun_IBGE] != "" ) )
		CodigoMunicipio = CodMun_IBGE[IndiceMun_IBGE]
	else 
		CodigoMunicipio = "NULO"
	
	# Se for gerar capital
	if (argCapital == 1) {
		if (CodigoMunicipio == "NULO") {
			if (toupper(argEstado) == "AC") CodigoMunicipio = 16
			if (toupper(argEstado) == "AL") CodigoMunicipio = 69
			if (toupper(argEstado) == "AM") CodigoMunicipio = 162
			if (toupper(argEstado) == "AP") CodigoMunicipio = 193
			if (toupper(argEstado) == "BA") CodigoMunicipio = 538
			if (toupper(argEstado) == "CE") CodigoMunicipio = 678
			if (toupper(argEstado) == "DF") CodigoMunicipio = 804
			if (toupper(argEstado) == "ES") CodigoMunicipio = 882
			if (toupper(argEstado) == "GO") CodigoMunicipio = 977
			if (toupper(argEstado) == "MA") CodigoMunicipio = 1314
			if (toupper(argEstado) == "MG") CodigoMunicipio = 1411
			if (toupper(argEstado) == "MT") CodigoMunicipio = 2314
			if (toupper(argEstado) == "MS") CodigoMunicipio = 2218
			if (toupper(argEstado) == "PA") CodigoMunicipio = 2436
			if (toupper(argEstado) == "PB") CodigoMunicipio = 2655
			if (toupper(argEstado) == "PE") CodigoMunicipio = 2916
			if (toupper(argEstado) == "PI") CodigoMunicipio = 3183
			if (toupper(argEstado) == "PR") CodigoMunicipio = 3286
			if (toupper(argEstado) == "RJ") CodigoMunicipio = 3658
			if (toupper(argEstado) == "RN") CodigoMunicipio = 3770
			if (toupper(argEstado) == "RO") CodigoMunicipio = 3886
			if (toupper(argEstado) == "RR") CodigoMunicipio = 3904
			if (toupper(argEstado) == "RS") CodigoMunicipio = 4242
			if (toupper(argEstado) == "SC") CodigoMunicipio = 4502
			if (toupper(argEstado) == "SE") CodigoMunicipio = 4708
			if (toupper(argEstado) == "SP") CodigoMunicipio = 5345
			if (toupper(argEstado) == "TO") CodigoMunicipio = 5514
		}
	}
	
	# Retorna o código do município encontrado
	return CodigoMunicipio
	#return argCidade
}

# RETORNA NOME DA CIDADE
function RetornaNomeMunicipio(argCidadeIBGE){
	NomeMun = ""
	
	IndiceMun_IBGE_2 = argCidadeIBGE
	
	if(NomeMun_IBGE[IndiceMun_IBGE_2] != "")
		NomeMun = NomeMun_IBGE[IndiceMun_IBGE_2]
	else
		NomeMun = "NULO"
	
	return NomeMun
}

# RETORNA UF DA CIDADE
function RetornaUFMunicipio(argCidadeCodigo){
	UFMun = ""
	
	IndiceMun_Codigo = argCidadeCodigo
	
	if(UFMun_Codigo[IndiceMun_Codigo] != "")
		UFMun = UFMun_Codigo[IndiceMun_Codigo]
	else
		UFMun = "NULO"
	
	return UFMun
}