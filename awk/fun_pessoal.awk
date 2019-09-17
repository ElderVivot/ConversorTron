BEGIN {
	FS = ";"; 
	OFS = FS;
	print "codi_pessoa", "nome", "endereco", "numero_end", "bairro", "cep", "cpf", "municipio_nascimento", "uf_nascimento", "municipio_endereco", "estado", "email", 
	      "email_alternativo", "tipo_endereco", "ddd_fone", "fone", "ddd_celular", "celular"
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	tipo = Campo("TIPPES")
	tipo = Trim(tipo)
	tipo = upperCase(tipo)
		
	cod_pes = Campo("CODPES")
	cod_pes = soNumeros(cod_pes)
	
	nome = Campo("NOMFUN")
	nome = Trim(nome)
	nome = upperCase(nome)
	
	end = Campo("LOGPES")
	end = Trim(end)
	end = upperCase(end)
	
	tipo_endereco_2 = tpEndereco(end)
	
	num = Campo("NUMPES")
	num = soNumeros(num)
	
	bairro = Campo("BAIPES")
	bairro = Trim(bairro)
	bairro = upperCase(bairro)
	
	cep =  Campo("CEPPES")
	cep = soNumeros(cep)
	
	cpf = Campo("INSPES")
	cpf = soNumeros(cpf)
	
	municipio_nascimento = Campo("NATPES")
	municipio_nascimento = soNumeros(municipio_nascimento)
	municipio_nascimento = RetornaCodigoMunicipio(municipio_nascimento, "", 0, 1)
	
	uf_nascimento = RetornaUFMunicipio(municipio_nascimento)
		
	municipio_endereco = Campo("CODCID")
	municipio_endereco = soNumeros(municipio_endereco)
	municipio_endereco = RetornaCodigoMunicipio(municipio_endereco, "", 0, 1)
	
	estado = RetornaUFMunicipio(municipio_endereco)
	
	email = Campo("EMARESPES")
	email = Trim(email)
	email = tolower(email)
	
	email_alternativo = Campo("EMACOMPES")
	email_alternativo = Trim(email_alternativo)
	email_alternativo = tolower(email_alternativo)
	
	tipo_endereco = Campo("CODTIPLOG")
	tipo_endereco = soNumeros(tipo_endereco)
	tipo_endereco = tpEnderecoTron(tipo_endereco)
	if(tipo_endereco == "NULO")
		tipo_endereco = tipo_endereco_2
	else
		tipo_endereco = tipo_endereco
	
	telefone = Campo("TELEFONE_PESSOA")
	telefone = soNumeros(telefone)
	
	fone = tFone(telefone)
	
	ddd_fone = Campo("DDD_PESSOA")
	ddd_fone = soNumeros(ddd_fone)
	ddd_fone = isNull(ddd_fone)
	if(ddd_fone == "NULO" && fone != "NULO")
		ddd_fone = 62
	else
		ddd_fone = IfElse( fone == "NULO", "NULO", ddd_fone )
	
	# VERIFICA SE EH CELULAR
	if( int( substr(fone, 1, 1) ) >= 8){
		ddd_celular = ddd_fone
		celular = noveCelular(fone)
		ddd_fone = "NULO"
		fone = "NULO"
	}
	else{
		ddd_fone = ddd_fone
		fone = fone
		ddd_celular = "NULO"
		celular = "NULO"
	}
	
	if(tipo == "F"){
		print cod_pes, nome, end, num, bairro, cep, cpf, municipio_nascimento, uf_nascimento, municipio_endereco, estado, email, email_alternativo, tipo_endereco,
		      ddd_fone, fone, ddd_celular, celular
	}     
	
}