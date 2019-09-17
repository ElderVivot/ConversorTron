BEGIN {
	FS = ";"; 
	OFS = FS;
	
	emitir_documentos = 0
	origem_reg = 1
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	codi_emp = Campo("CODEMPFOL")
	codi_emp = soNumeros(codi_emp)
	
	i_empregados = Campo("MATEPGCTT")
	i_empregados = soNumeros(i_empregados)
	i_empregados = RetornaInformacaoFun(codi_emp, i_empregados)
	
	admissao = Campo("DTAADMTRACTT")
	admissao = Trim(admissao)
	admissao = FormatDate(admissao, "-", "US")
	admissao = isDate(admissao)
	
	municipio_endereco = Campo("CODCID")
	municipio_endereco = soNumeros(municipio_endereco)
	municipio_endereco = RetornaCodigoMunicipio(municipio_endereco, "", 0, 1)
	
	data_nascimento = Campo("DTANSCPES")
	data_nascimento = Trim(data_nascimento)
	data_nascimento = FormatDate(data_nascimento, "-", "US")
	data_nascimento = isDate(data_nascimento)
	
	tipo = Campo("TIPCERCIV")
	tipo = Trim(tipo)
	tipo = certCivil(tipo)
	
	data_emissao = Campo("DTAEMICERCIV")
	data_emissao = Trim(data_emissao)
	data_emissao = FormatDate(data_emissao, "-", "US")
	data_emissao = isDate(data_emissao)
	if( data_emissao == "NULO" && int(tipo) == 1 )
		data_emissao = data_nascimento
	else if( data_emissao == "NULO" && int(tipo) > 1 )
		data_emissao = admissao
	else
		data_emissao = data_emissao
		
	termo_matricula = Campo("TERMATCERCIV")
	termo_matricula = Trim(termo_matricula)
	
	livro = Campo("LIVCERCIV")
	livro = Trim(livro)
	
	folha = Campo("FOLCERCIV")
	folha = Trim(folha)
	
	cartorio = Campo("CARCERCIV")
	cartorio = Trim(cartorio)
	
	codigo_municipio = Campo("MUCCERCIV")
	codigo_municipio = soNumeros(codigo_municipio)
	codigo_municipio = RetornaCodigoMunicipio(codigo_municipio, "", 0, 1)
	if( codigo_municipio == "NULO" )
		codigo_municipio = municipio_endereco
	else
		codigo_municipio = codigo_municipio
	
	if( i_empregados != "" && data_emissao != "NULO" && codigo_municipio != "NULO" )
		print codi_emp, i_empregados, tipo, data_emissao, termo_matricula, livro, folha, cartorio, codigo_municipio, emitir_documentos, origem_reg
	else
		print codi_emp, i_empregados, tipo, data_emissao, termo_matricula, livro, folha, cartorio, codigo_municipio, emitir_documentos, 
	    origem_reg > "..\\temp\\fun_certidoes_civis_invalidas.csv"
	
}