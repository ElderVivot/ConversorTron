BEGIN{
	FS = ";";
	OFS = FS;
	
	sem_uso = "NULO";
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	cod = Campo("CODSIN")
	cod = soNumeros(cod)
	cod = FormataCampo("integer", cod, 15, 0)
	cod = cod + 5
	
	tipo = Campo("TIPSIN")
	tipo = Trim(tipo)
	
	nome = Campo("NOMSIN")
	nome = Trim(nome)
	nome = subsCharEspecial(nome)
	nome = upperCase(nome)
	
	# apelido = substr(nome, 1, 20)
	
	end = Campo("LOGSIN")
	end = Trim(end)
	end = subsCharEspecial(end)
	end = upperCase(end)
	
	num = Campo("NUMSIN")
	num = soNumeros(num)
	if (int(num) == 0) 
		num = "NULO"
	else
		num = num
	
	bairro = Campo("BAISIN")
	bairro = Trim(bairro)
	bairro = subsCharEspecial(bairro)
	bairro = upperCase(bairro)
	
	cep = Campo("CEPSIN")
	cep = soNumeros(cep)
	
	mes_contr = Campo("DIAMESBASCONSIN")
	mes_contr = Trim(mes_contr)
	mes_contr = FormatDate(mes_contr, "-", "US")
	mes_contr = isDate(mes_contr)
	
	cnpj = Campo("INSSIN")
	cnpj = soNumeros(cnpj)
	
	pagina_internet = tolower(Campo("SITSIN"))
	pagina_internet = Trim(pagina_internet)
	
	email = tolower(Campo("EMASIN"))
	email = Trim(email)
	
	cidade = Campo("CIDADE")
	cidade = Trim(cidade)
	
	estado = Campo("ESTADO")
	estado = Trim(estado)
	
	mes_base = Campo("MESBASAUMSIN")
	mes_base = soNumeros(mes_base)
	
	if ( mes_contr == "NULO" )
		mes_contr = 1
	else {
		split(mes_contr, data_mes, "/")
		mes_contr = data_mes[2]
	}
	
	if ((int(mes_base) <= 0)||(int(mes_base) > 12))
		mes_base = 3
	else
		mes_base = mes_base
	
	telefone = Campo("TELEFONE_SIND")
	telefone = soNumeros(telefone)
	
	fone_temp = tFone(telefone)
	fone_temp = noveCelular(fone_temp)
	
	ddd_fone = Campo("DDD_SIND")
	ddd_fone = soNumeros(ddd_fone)
	ddd_fone = isNull(ddd_fone)
	if(ddd_fone == "NULO" && fone_temp != "NULO")
		ddd_fone = 62
	else
		ddd_fone = ddd_fone
	
	fone = Ddd_Fone(ddd_fone, fone_temp)
	
	fax = fone_temp
	
	codi_entidade = Campo("CODSINSIN")
	codi_entidade = soNumeros(codi_entidade)
		
	if (tipo == "F")
		print "", cod, nome, end, num, bairro, cep, cnpj, mes_contr, mes_base, cidade, estado, pagina_internet, email, fone, fax, codi_entidade, ""
	else{
		# DADOS QUE NÃO SERÃO BUSCADOS DA TRON
		complemento = sem_uso
		agencia = sem_uso
		tipo_entidade = 1
		codi_entidade_pat = ""
		i_fotabcal_patronal = sem_uso
		apelido = ""
		
		print cod, nome, cnpj, end, num, bairro, complemento, cep, cidade, estado, fone, fax, agencia, tipo_entidade, codi_entidade_pat, i_fotabcal_patronal,
              email, pagina_internet, apelido > "..\\prontos\\2_fosindicatospatronal.csv"
	}	
}