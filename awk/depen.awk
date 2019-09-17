BEGIN { 
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

	# AVALIAR SE NAO VAI REPETIR OS CODIGOS	
	i_filhos = Campo("CODDPDEPG")
	i_filhos = soNumeros(i_filhos)
	
	codi_pessoa = Campo("CODPESEPG")
	codi_pessoa = soNumeros(codi_pessoa)
	
	nome = Campo("NOMDEPEPG")
	nome = Trim(nome)
	nome = subsCharEspecial(nome)
	nome = upperCase(nome)
	nome = IfElse( nome == "NULO", "SEM NOME", nome )
	
	data_nascto = Campo("DTANSCDPDEPG")
	data_nascto = Trim(data_nascto)
	data_nascto = FormatDate(data_nascto, "-", "US")
	data_nascto = isDate(data_nascto)
	
	grau_parentesco = Campo("GRAPARDPDEPG")
	grau_parentesco = Trim(grau_parentesco)
	grau_parentesco = upperCase(grau_parentesco)
	if(grau_parentesco == "FI") # FILHO ATE 21 ANOS
		grau_parentesco = 2
	else if(grau_parentesco == "CO") # CONJUGE
		grau_parentesco = 1
	else 
		grau_parentesco = 2 # VALOR PADRAO SERA FILHO SE ACASO NAO RETORNAR NADA
	   
	cartorio_registro = Campo("NOMCARREGDPDEPG")
	cartorio_registro = Trim(cartorio_registro)
	
	num_reg_cart = Campo("REGDPDEPG")
	num_reg_cart = Trim(num_reg_cart)
	
	livro_folha = Campo("LIVFOLDPDEPG")
	livro_folha = Trim(livro_folha)
	livro_folha = split(livro_folha, vet_livro_folha, "/")
	
	nlivro = vet_livro_folha[1]
	
	nfolha = vet_livro_folha[2]
	
	local_nascto = Campo("NATDPDEPG")
	local_nascto = soNumeros(local_nascto)
	local_nascto = RetornaNomeMunicipio(local_nascto)
	
	if(grau_parentesco == 2){ # Filho até 21 anos
		dependente = "S" # MARCA O IRRF
		filho = "S" # MARCA O SALARIO FAMILIA
		idade_fim_fil = 14
		idade_fim_dep = 21
		sal_fam_fim_determinado = "S"
		depend_irrf_fim_determinado = "S"
		sal_fam_fim = SomaAno(data_nascto, 14, "BR")
		depend_irrf_fim = SomaAno(data_nascto, 21, "BR")
	}
	else{
		dependente = "N"
		filho = "N"
		idade_fim_fil = ""
		idade_fim_dep = ""
		sal_fam_fim_determinado = "N"
		depend_irrf_fim_determinado = "N"
		sal_fam_fim = sem_uso
		depend_irrf_fim = sem_uso
	}
	
	# ------------- CAMPOS QUE NAO SERAO BUSCADOS DA TRON E SIM COLADOS FIXOS PARA SEGUIR O LAYOUT PADRAO DA DOMINIO --------------- #
	vencto_cart_vacina = sem_uso
	vencto_atest_freq = sem_uso
	origem_reg = 1
	plano_saude_optante = sem_uso
	plano_saude_inicio = sem_uso
	plano_saude_fim = sem_uso
	plano_saude_fim_determinado = sem_uso
	declaracao_nascido_vivo = sem_uso
	matricula_certidao_nascimento = sem_uso
	recebe_pensao_alimenticia = 0
	determinar_fim_pensao_alimenticia = 0
	data_fim_pensao_alimenticia = sem_uso
	gerar_compensacao_per_dcomp = 0
	competencia_inicio_compensacao_per_dcomp = sem_uso
	determinar_fim_compensacao_per_dcomp = 0
	competencia_fim_compensacao_per_dcomp = sem_uso
	data_entrega = sem_uso
	cpf = sem_uso
	
	# CODI_EMP, I_EMPREGADOS SERA GERADO NO PROXIMO AWK
	
	print codi_pessoa, i_filhos, nome, data_nascto, local_nascto, cartorio_registro, num_reg_cart, filho, idade_fim_fil, dependente,
	      idade_fim_dep, grau_parentesco, nlivro, nfolha, data_entrega, vencto_cart_vacina, vencto_atest_freq, origem_reg, plano_saude_optante,
		  plano_saude_inicio, plano_saude_fim, plano_saude_fim_determinado, sal_fam_fim, sal_fam_fim_determinado, depend_irrf_fim,
		  depend_irrf_fim_determinado, declaracao_nascido_vivo, matricula_certidao_nascimento, cpf, recebe_pensao_alimenticia, determinar_fim_pensao_alimenticia, 
		  data_fim_pensao_alimenticia, gerar_compensacao_per_dcomp, competencia_inicio_compensacao_per_dcomp, determinar_fim_compensacao_per_dcomp, 
		  competencia_fim_compensacao_per_dcomp
	
	
    
}