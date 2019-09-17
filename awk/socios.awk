BEGIN{ 
	FS = ";"; 
	OFS = FS;
	i_socio = 2;
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	i_socio = Campo("CODSCORSP")
	i_socio = soNumeros(i_socio)
	i_socio = FormataCampo("integer", i_socio, 15, 0)
	i_socio = i_socio + 2 # O DE CÓDIGO 1 E 2 JÁ ESTÃO CADASTRADOS
	
	nome = Campo("NOMSCORSP")
	nome = Trim(nome)
	nome = subsCharEspecial(nome)
	nome = upperCase(nome)
	
	primeiro_nome = split(nome, so_nome, " ")
	primeiro_nome = so_nome[1]
	
	ultima_letra_primeiro_nome = substr(primeiro_nome, length(primeiro_nome), 1)
	
	if( ultima_letra_primeiro_nome == "A" || ultima_letra_primeiro_nome == "I" || ultima_letra_primeiro_nome == "Y")
		sexo = "F"
	else
		sexo = "M"
	
	if(sexo == "F")
		nacionalidade = "BRASILEIRA"
	else
		nacionalidade = "BRASILEIRO"
	
	identidade = Campo("IDESCORSP")
	identidade = Trim(identidade)
	
	endereco = Campo("LGRSCORSP")
	endereco = Trim(endereco)
	endereco = subsCharEspecial(endereco)
	endereco = upperCase(endereco)
	
	numero = Campo("NUMSCORSP")
	numero = soNumeros(numero)
	
	bairro = Campo("BAISCORSP")
	bairro = Trim(bairro)
	bairro = subsCharEspecial(bairro)
	bairro = upperCase(bairro)
	
	cep = Campo("CEPSCORSP")
	cep = soNumeros(cep)
	
	email = Campo("EMASCORSP")
	email = Trim(email)
	email = tolower(email)
	
	codigo_municipio = Campo("CODCID")
	codigo_municipio = soNumeros(codigo_municipio)
	codigo_municipio = RetornaCodigoMunicipio(codigo_municipio, "", 0, 1)
	
	uf = RetornaUFMunicipio(codigo_municipio)
	
	cidade = Campo("CODCID")
	cidade = soNumeros(cidade)
	cidade = RetornaNomeMunicipio(cidade)
	
	orgao_exp_ident = Campo("ORGEXPSCORSP")
	orgao_exp_ident = Trim(orgao_exp_ident)
	
	uf_ident = RetornaUFCampo(orgao_exp_ident)
	
	orgao_emissor_ident = RetornaCampoSemUF(orgao_exp_ident)
	
	inscricao = Campo("INSSCORSP")
	inscricao = soNumeros(inscricao)
	
	tipo_insc = Campo("TIPINSSCORSP")
	tipo_insc = soNumeros(tipo_insc)
	if(tipo_insc == 3)
	   tipo_insc = 2
	else
		tipo_insc = 1
	
	telefone = Campo("TELSCORSP")
	telefone = soNumeros(telefone)
	
	fone_res = tFone(telefone)
	fone_res = noveCelular(fone_res)
	
	ddd_fone = dddFone(telefone)
	if(ddd_fone == "NULO" && fone_res != "NULO")
		ddd_fone = 62
	else
		ddd_fone = ddd_fone
	
	if( substr(fone, 1, 1) == 9 )
		fone_cel = Ddd_Fone(ddd_fone, fone_res)
	else
		fone_cel = "NULO"
	
	dtnascimento = Campo("DTANSCRSP")
	dtnascimento = Trim(dtnascimento)
	dtnascimento = FormatDate(dtnascimento, "-", "US")
	dtnascimento = isDate(dtnascimento)
	
	profissao = Campo("DESCCAR")
	profissao = Trim(profissao)
	profissao = subsCharEspecial(profissao)
	profissao = upperCase(profissao)
	
	# DADOS QUE NÃO SERÃO BUSCADO DA TRON
	sem_uso = "NULO"
	complemento = sem_uso
	tipo_imovel = sem_uso
	pai = sem_uso
	mae = sem_uso
	emancipado = "N"
	forma_emancipacao = sem_uso
	fone_com = sem_uso
	fone_fax = sem_uso
	cart_reservista = sem_uso
	cart_ident_profissional = sem_uso
	origem_reg = 1
	nome_conjuge = sem_uso
	cpf_conjuge = sem_uso
	identidade_conjuge = sem_uso
	orgao_emissor_conjuge = sem_uso
	emissao_ident_conjuge = sem_uso
	uf_ident_conjuge = sem_uso
	dtnascimento_conjuge = sem_uso
	profissao_conjuge = sem_uso
	renda_conjuge = sem_uso
	endereco_com = sem_uso
	bairro_com = sem_uso
	cidade_com = sem_uso
	cep_com = sem_uso
	uf_com = sem_uso
	complemento_com = sem_uso
	numero_com = sem_uso
	ddd_com = sem_uso
	formacao_academ = sem_uso
	nivel_academ = sem_uso
	cnpj_escola = sem_uso
	previsao_conclusao = sem_uso
	cartao_credito = sem_uso
	plano_saude = sem_uso
	plano_previdencia = sem_uso
	hobby = sem_uso
	recursos_tecnologicos = sem_uso
	codigo_pais = 30
	certificado_digital = sem_uso
	titulo_eleitoral = sem_uso
	zona_eleitoral = sem_uso
	secao_eleitoral = sem_uso
	titulo_eleitoral_conjuge = sem_uso
	zona_eleitoral_conjuge = sem_uso
	secao_eleitoral_conjuge = sem_uso
	naturalidade = sem_uso
	estado_civil = sem_uso
	regime_casamento = sem_uso
	data_emissao_ident = sem_uso
	cart_trabalho = sem_uso
	cart_motorista = sem_uso
	escolaridade = sem_uso
	valor_aluguel_finan = sem_uso
	naturalidade_uf = sem_uso
	responsavel_legal_empresa_junto_base_rfb = "N"
	
	print i_socio, nome, sexo, endereco, bairro, cidade, cep, numero, uf, complemento, tipo_imovel, profissao, pai, mae, emancipado,
	      forma_emancipacao, ddd_fone, fone_com, fone_res, fone_cel, fone_fax, nacionalidade, naturalidade, estado_civil, regime_casamento, dtnascimento,
		  tipo_insc, inscricao, identidade, orgao_emissor_ident, uf_ident, data_emissao_ident, cart_reservista, cart_ident_profissional, cart_trabalho, cart_motorista,
		  origem_reg, nome_conjuge, cpf_conjuge, identidade_conjuge, orgao_emissor_conjuge, emissao_ident_conjuge, uf_ident_conjuge, dtnascimento_conjuge,
		  profissao_conjuge, renda_conjuge, endereco_com, bairro_com, cidade_com, cep_com, uf_com, complemento_com, numero_com, ddd_com, escolaridade,
		  formacao_academ, nivel_academ, cnpj_escola, previsao_conclusao, valor_aluguel_finan, cartao_credito, plano_saude, plano_previdencia, hobby,
		  recursos_tecnologicos, naturalidade_uf, codigo_pais, certificado_digital, titulo_eleitoral, zona_eleitoral, secao_eleitoral,
		  titulo_eleitoral_conjuge, zona_eleitoral_conjuge, secao_eleitoral_conjuge, email, responsavel_legal_empresa_junto_base_rfb
}