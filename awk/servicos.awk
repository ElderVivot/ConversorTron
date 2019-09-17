BEGIN { 
	FS = ";"; 
	OFS = FS;
	sem_uso = "NULO";
	
	# DADOS DA TABELA FOSERVICOS
	situacao = 1
	data_inativacao = sem_uso
	data_inicio = sem_uso # SERA IMPLEMENTADO NO PROXIMO AWK E POSTERIORMENTE FAZ A VERIFICACAO NO DATA_INICIO.AWK
	
	# DADOS DA TABELA FOVIGENCIAS_SERVICOS
	descricao = "VIGENCIA CONVERSAO"
	perc_acid_trabalho = 0
	codigo_sat = 0
	codigo_atividade = 0
	i_bancos = sem_uso
	numero_fgts = 0
	cidade = sem_uso
	i_filiais = 1
	sequencia_gps = 1
	tipo = 1
	codi_mun = sem_uso
	i_fpas = sem_uso
	calcula_inss_empresa_lei_12546 = sem_uso
	tipo_servico_tomador = sem_uso
	tipo_inscricao_contratante_empreitada_parcial = sem_uso
	inscricao_contratante_empreitada_parcial = sem_uso
	nome_contratante_empreitada_parcial = sem_uso
	tipo_inscricao_proprietario_cei_empreitada_parcial = sem_uso
	inscricao_proprietario_cei_empreitada_parcial = sem_uso
	nome_proripeitario_cei_empreitada_parcail = sem_uso
	tipo_informacao_aliquota_acidente_trabalho = sem_uso
	i_processo = sem_uso
	i_scp = sem_uso
	competencia_fim_vigencia = sem_uso
	i_processo_terceiros = sem_uso
	caepf = sem_uso
	tipo_caepf = sem_uso
	codigo_fpas = sem_uso # SERA IMPLEMENTADO NO PROXIMO AWK
	perc_autonomos = 0
	perc_inss_empresa = 0
	filantropia = sem_uso
	perc_terceiro = 0
	codigo_terceiro = 0
	tipo_lotacao_esocial = sem_uso
	registro_ponto = 0
	contrato_aprendiz = 1
	i_processo_contratao_aprendiz = sem_uso
	realiza_contratao_aprendiz_intermedio_entidade_educativa_sem_fins_lucrativos = 0
	codigo_suspensao_processo_rat = sem_uso
	soma_codigos_suspensao_terceiros = sem_uso
	percentual_terceiro_bruto = sem_uso
	i_terceiros = sem_uso
}
{
	
	if(FNR == 1){
		for (c=1; c<=NF; c++)
			Coluna[$c] = c
		next
	}
	
	codi_emp = Campo("CODEMPFOL")
	codi_emp = soNumeros(codi_emp)	
	
	# TEM OUTROS CAMPOS COM O MESMO NOME, ENTAO EH MELHOR COLOCAR O NUMERO DA COLUNA
	i_servicos = $3
    i_servicos = soNumeros(i_servicos)
	i_servicos = FormataCampo("integer", i_servicos, 15)
	i_servicos = i_servicos + 1 # RECEBE O CODIGO + 1 POIS O 1 JAH EXISTE E FOI GERADO NO ARQUIVO DE EMPRESAS.AWK
	
	codigo_esocial = i_servicos
	
	nome = Campo("NOMFUN")
	nome = Trim(nome)
	nome = subsCharEspecial(nome)
	nome = upperCase(nome)
	
	endereco = Campo("LOGPES")
	endereco = Trim(endereco)
	endereco = subsCharEspecial(endereco)
	endereco = upperCase(endereco)
	
	tipo_endereco_temp = tpEndereco(endereco)
	
	tipo_endereco = Campo("CODTIPLOG")
	tipo_endereco = int(tipo_endereco)
	#tipo_endereco = tpEnderecoTron(tipo_endereco) # TODOS JAH SAO IGUAIS
	if(tipo_endereco == "NULO")
		tipo_endereco = tipo_endereco_temp
	else
		tipo_endereco = tipo_endereco
	
	numero = Campo("NUMPES")
	numero = soNumeros(numero)
	numero = IfElse( numero == "", "NULO", numero )
	
	complemento = sem_uso
	
	cep = Campo("CEPPES")
	cep = soNumeros(cep)
	
	bairro = Campo("BAIPES")
	bairro = Trim(bairro)
	bairro = subsCharEspecial(bairro)
	bairro = upperCase(bairro)
	
	# IBGE/RAIS
	codigo_municipio = Campo("CODCID")
	codigo_municipio = soNumeros(codigo_municipio)
	codigo_municipio = RetornaCodigoMunicipio(codigo_municipio, "", 0, 1)
	
	estado = RetornaUFMunicipio(codigo_municipio)
	
	cgc = Campo("INSTOM")
	cgc = soNumeros(cgc)
	
	tipo_insc = tpInscricao(cgc)
	
	i_cnae20 = Campo("CODCLSATVCNADOI")
	i_cnae20 = soNumeros(i_cnae20)
	if(length(i_cnae20) < 7){
		i_cnae20 = Campo("CODSUBCLSATVCNADOI")
		i_cnae20 = soNumeros(i_cnae20)   
	}
	i_cnae20 = RetornaCodigoCnae20(i_cnae20)
	
	codigo_gfip = Campo("CODRECSFP")
	codigo_gfip = soNumeros(codigo_gfip)
	codigo_gfip = FormataCampo("integer", codigo_gfip, 15, 0)
	if ( (codigo_gfip != 115) && (codigo_gfip != 150) && (codigo_gfip != 155) && (codigo_gfip != 211) ) 
		codigo_gfip = 115
	else
		codigo_gfip = codigo_gfip
	
	codigo_gps = Campo("CODGPS")
	codigo_gps = Trim(codigo_gps)
	codigo_gps = isNull(codigo_gps)
	codigo_gps = IfElse( codigo_gps == "NULO", 2100, codigo_gps )
	
	codi_fpas = Campo("CODFPA")
	codi_fpas = Trim(codi_fpas)
	codi_fpas = isNull(codi_fpas)
	codi_fpas = IfElse( codi_fpas == "NULO", 515, codi_fpas )
	
	perc_acid_trabalho = Campo("ALIACITRATOM")
	perc_acid_trabalho = Trim(perc_acid_trabalho)
	perc_acid_trabalho = FormataCampo("double", perc_acid_trabalho, 5, 3)
	
	perc_autonomos = Campo("ALIINSAUTFPA")
	perc_autonomos = Trim(perc_autonomos)
	perc_autonomos = FormataCampo("double", perc_autonomos, 5, 3)
	
	perc_prob_lab = Campo("ALIINSPROLABFPA")
	perc_prob_lab = Trim(perc_prob_lab)
	perc_prob_lab = FormataCampo("double", perc_prob_lab, 5, 3)
	
	perc_autonomos = IfElse( perc_autonomos == "0.000", perc_prob_lab, perc_autonomos )
	
	perc_inss_empresa = Campo("ALIINSFOLPAGFPA")
	perc_inss_empresa = Trim(perc_inss_empresa)
	perc_inss_empresa = FormataCampo("double", perc_inss_empresa, 5, 3)
	
	codigo_terceiro = Campo("CODTERFPAOUTENT")
	codigo_terceiro = soNumeros(codigo_terceiro)
	codigo_terceiro = isNull(codigo_terceiro)
	codigo_terceiro = IfElse( codigo_terceiro == "NULO", 0, codigo_terceiro )
	
	perc_terceiro = Campo("ALQTERFPAOUTENT")
	perc_terceiro = Trim(perc_terceiro)
	perc_terceiro = FormataCampo("double", perc_terceiro, 5, 3)
	
	percentual_terceiro_bruto = perc_terceiro
	
	i_dados_evento_esocial_s_1005 = ""
	i_dados_evento_esocial_s_1005 = RetornaILote_4(cgce_emp, "1005" )
	
	i_lote_esocial_s_1005 = i_dados_evento_esocial_s_1005
	
	status_esocial_s_1005 = IfElse( i_lote_esocial_s_1005 == "NULO", "NULO", 3 )
	
	enviar_esocail_s_1005 = IfElse( i_lote_esocial_s_1005 == "NULO", 1, 0 )
	
	inclusao_validada_esocial_s_1005 = IfElse( i_lote_esocial_s_1005 == "NULO", 0, 1 )
	
	gerar_retificao_esocial_s_1005 = 0
	
	i_dados_evento_esocial_s_1020 = ""
	i_dados_evento_esocial_s_1020 = RetornaILote_4(cgce_emp, "1020" )
	
	i_lote_esocial_s_1020 = i_dados_evento_esocial_s_1020
	
	status_esocial_s_1020 = IfElse( i_lote_esocial_s_1020 == "NULO", "NULO", 3 )
	
	enviar_esocail_s_1020 =  IfElse( i_lote_esocial_s_1020 == "NULO", 1, 0 )
	
	inclusao_validada_esocial_s_1020 =  IfElse( i_lote_esocial_s_1020 == "NULO", 0, 1 )
	
	gerar_retificao_esocial_s_1020 = 0
	
	codigo_esocial = ""
	codigo_esocial = RetornaCodigoEsocial_3( cgce_emp, "1020" )
	codigo_esocial = IfElse( codigo_esocial == "NULO", i_servicos, codigo_esocial )
	
	i_cnae_esocial = RetornaCodigoCnaeEsocial( i_cnae20 )
	
	print codi_emp, i_servicos, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, nome,
		  sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, origem_reg, sem_uso, sem_uso, sem_uso, sem_uso, data_inicio, situacao,
		  data_inativacao, codigo_esocial, i_dados_evento_esocial_s_1005, i_lote_esocial_s_1005, status_esocial_s_1005, enviar_esocail_s_1005, inclusao_validada_esocial_s_1005, 
		  gerar_retificao_esocial_s_1005 > "..\\temp\\foservicos02.csv"
		  
	print codi_emp, i_servicos, data_inicio, descricao, cgc, tipo_insc, codigo_terceiro, perc_terceiro, perc_inss_empresa, perc_acid_trabalho, codigo_sat,
		  perc_autonomos, codigo_fpas, codigo_atividade, codigo_gfip, codigo_gps, i_bancos, numero_fgts, endereco, numero, bairro, cep, cidade, estado,
		  i_filiais, sequencia_gps, filantropia, origem_reg, tipo, codi_mun, codigo_municipio, i_fpas, calcula_inss_empresa_lei_12546, tipo_servico_tomador,
		  tipo_endereco, complemento, tipo_inscricao_contratante_empreitada_parcial, inscricao_contratante_empreitada_parcial, nome_contratante_empreitada_parcial,
		  tipo_inscricao_proprietario_cei_empreitada_parcial, inscricao_proprietario_cei_empreitada_parcial, nome_proripeitario_cei_empreitada_parcail, i_cnae20,
		  tipo_informacao_aliquota_acidente_trabalho, i_processo, i_scp, dddf_emp, fone_emp, competencia_fim_vigencia, tipo_lotacao_esocial, i_processo_terceiros,
		  caepf, tipo_caepf, registro_ponto, contrato_aprendiz, i_processo_contratao_aprendiz, realiza_contratao_aprendiz_intermedio_entidade_educativa_sem_fins_lucrativos,
		  codigo_suspensao_processo_rat, soma_codigos_suspensao_terceiros, percentual_terceiro_bruto, i_dados_evento_esocial_s_1005, i_lote_esocial_s_1005, status_esocial_s_1005, 
		  enviar_esocail_s_1005, inclusao_validada_esocial_s_1005, gerar_retificao_esocial_s_1005, i_dados_evento_esocial_s_1020, i_lote_esocial_s_1020, status_esocial_s_1020, 
		  enviar_esocail_s_1020, inclusao_validada_esocial_s_1020, gerar_retificao_esocial_s_1020, i_cnae_esocial, i_terceiros > "..\\temp\\fovigencias_servico02.csv"	
		  
}