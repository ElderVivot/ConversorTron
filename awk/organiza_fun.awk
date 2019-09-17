BEGIN{
	FS = ";";
	OFS = FS;
	sem_uso = "NULO";
	i_bancos_cadastro = 2;
	#data_conversao_original = substr(data_conversao_orig, 7, 4) "" substr(data_conversao_orig, 4, 2) "" substr(data_conversao_orig, 1, 2);
	
	# DADOS QUE NAO SERAO BUSCADOS DA TRON
	i_horaemp = sem_uso
	i_filiais = 1
	pagou_cont_sindical = "S"
	cidade = sem_uso
	local_nascimento = sem_uso
	ano_chegada = sem_uso
	num_cart_ponto = sem_uso
	venc_exame_medico = sem_uso
	nacionalidade = 10 # NAO SEI PARA O QUE SERVE
	sai_rais = "S"
	emprego_ant = 1
	tipo_visto_estrangeiro = sem_uso
	validade_id_estr = sem_uso
	validade_ctrab_estr = sem_uso
	grupo_sanguineo = "X"
	rh_sanguineo = "X"
	nome_conjuge = sem_uso # ESTUDAR PARA IMPLANTAR
	ultimo_exame_medico = sem_uso
	i_conselhos = sem_uso
	num_reg_cons_reg = sem_uso
	regiao_reg_cons_regional = sem_uso
	i_estabilidade = sem_uso
	inicio_estabilidade = sem_uso
	fim_estabilidade = sem_uso
	i_localtrab = sem_uso
	empresa_outro_vinc = sem_uso
	codigo_vinc_outra_emp = sem_uso
	ult_cont_sind = sem_uso
	i_niveis = 0
	i_clasniveis = sem_uso
	i_refeniveis = 0
	matricula = sem_uso
	matric_inss = sem_uso
	tipo_contrib = "X"
	contrib_indiv = "N"
	classe_atual = sem_uso
	data_classe = sem_uso
	troca_aut_clas = 0
	evento_prolabore = sem_uso
	gps_trimestral = 0
	gps_deducao = 0
	i_contribuintes = sem_uso
	tipo_epr = 1
	usa_sist = 1
	tempermuta = 0
	i_turmas = sem_uso
	relogio1 = 0
	relogio2 = 0
	relogio3 = 0
	relogio4 = 0
	relogio5 = 0
	aco_nao_aut = "R"
	codigo_exportacao = sem_uso
	transf_codi_emp = sem_uso # ESTUDAR PARA IMPLANTAR
	transf_i_empregados = sem_uso
	regime_trabalho = sem_uso
	autoriza_tf = "N"
	tipo_valor_tf = 1
	valor_tf = "0.00"
	data_emissao_tf = sem_uso
	matricula_tf = sem_uso
	sindicalizado = 0
	imprime_recibo = 1
	origem_reg = 1
	fone2 = sem_uso
	tipo_servico = "N"
	contr_sobre_sal_min = 0
	contr_sobre_sal_min_data = sem_uso
	simples_072007 = 1
	data_calc_afastamentos = sem_uso
	i_afastamentos = 1
	alvara_judicial = 2
	i_operadoraplanosaude = sem_uso
	plano_saude_optantes = 0
	opcao_plano_saude = 0
	data_reintegracao = sem_uso
	tipo_inscricao_filial_origem = sem_uso
	inscricao_filial_origem = sem_uso
	matricula_origem = sem_uso
	nome_empresa_origem = sem_uso
	numero_processo_mte = sem_uso
	nif = sem_uso
	numero_ric = sem_uso
	orgao_emissor_ric = sem_uso
	local_ric = sem_uso
	data_expedicao_ric = sem_uso
	data_validade_ric = sem_uso
	residente_exterior = 0
	pais_endereco = 30
	pais_nascimento = 30
	beneficiado_pat = 0
	contr_sobre_sal_min_tipo = sem_uso
	gps_conjunta_novembro_13_integral = sem_uso
	gps_conjunta_novembro_13_integral_inicio = sem_uso
	beneficiado_pat_servico_proprio = 0
	beneficiado_pat_administracao_cozinhas = 0
	beneficiado_pat_refeicao_convenio = 0
	beneficiado_pat_refeicoes_transportadas = 0
	beneficiado_pat_cesta_alimentos = 0
	beneficiado_pat_alimentacao_convenio = 0
	atividade_conta_propria_rural = sem_uso
	numero_passaporte = sem_uso
	emissor_passaporte = 1
	uf_passaporte = sem_uso
	data_emissao_passaporte = sem_uso
	data_validade_passaporte = sem_uso
	pais_passaporte = sem_uso
	tipo_indicativo_admissao = 2
	nome_municipio_residente_exterior = sem_uso
	pais_nacionalidade = 30
	codigo_postal = sem_uso
	tipo_processo_alvara = sem_uso
	autoria_alvara = sem_uso
	numero_alvara = sem_uso
	indicativo_decisao_alvara = sem_uso
	data_decisao_alvara = sem_uso
	montante_integral_depositado_alvara = sem_uso
	inicio_vigencia_alvara = sem_uso
	fim_vigencia_alvara = sem_uso
	identificacao_alvara = sem_uso
	codigo_municipio_alvara = sem_uso
	possui_deficiencia_motora = 0
	possui_deficiencia_outras = 0 # ESTUDAR PARA IMPLANTAR
	observacao_deficiencia = sem_uso
	i_funcao = sem_uso
	numero_rne = sem_uso
	data_expedicao_rne = sem_uso
	orgao_emissor_rne = sem_uso
	endereco_comercial = 0
	i_processo = sem_uso
	codigo_sce_dominio_atendimento = sem_uso
	i_agentes_integracao = sem_uso
	i_coordenador_estagio = sem_uso
	area_atuacao_estagiario = sem_uso
	natureza_estagio = sem_uso
	nivel_estagio = sem_uso
	apolice_seguro_estagiario = sem_uso
	situacao_qualificacao_cadastral_inss_receita_federal = 0
	caixa_postal = sem_uso
	cep_caixa_postal = sem_uso
	motivo_contratacao_trabalho_temporario = sem_uso
	nome_trabalhador_substituido_trabalho_temporario = sem_uso
	cpf_trabalhador_substituido_trabalho_temporario = sem_uso
	matricula_trabalhador_substituido_trabalho_temporario = sem_uso
	tipo_horario = 1
	i_remuneracao_variavel = sem_uso
	i_processo_reintegracao = sem_uso
	possui_reducao_aliquota_inss = 0
	possui_reducao_aliquota_inss_competencia = sem_uso
	recebia_seguro_desemprego = 0
	natureza_trabalho_autonomo = sem_uso
	ddd_fone2 = sem_uso
	ddd_contato_2 = sem_uso
	contato_2 = sem_uso
	inscricao_municipal_autonomo = sem_uso
	dirigente_sindical = 0
	cnpj_empresa_origem_dirigente_sindical = sem_uso
	nome_empresa_origem_dirigente_sindical = sem_uso
	categoria_origem_dirigente_sindical = sem_uso
	data_admissao_empresa_origem_dirigente_sindical = sem_uso
	matricula_empresa_origem_dirigente_sindical = sem_uso
	responsavel_remuneracao_dirigente_sindical = sem_uso
	tipo_remuneracao_dirigente_sindical = sem_uso
	data_inicio_pagamento_adicional_dirigente_sindical = sem_uso
	remuneracao_sindicato_dirigente_sindical = sem_uso
	remuneracao_empresa_dirigente_sindical = sem_uso
	usa_salario_minimo_estadual = 0
	i_tabcalc_salario_minimo_estadual = sem_uso
	i_categoria_salario_minimo_estadual = sem_uso
	empresa_origem_desonerada = 0
	remuneracao_periodo_desligamento_reintegracao_pagas_juizo = sem_uso
	codigo_municipio_ric = sem_uso
	brasileiro_nascido_exterior = 0
	calcular_inss_patronal = 1
	carga_horaria_variavel = 0
	data_operacao_conectivade_social = sem_uso
	chave_identificacao_conectivade_social = sem_uso
	data_real_dn_afastamento_da = sem_uso
	calcular_adiantamento_salarial = 1
	calculo_adiantamento_salarial_percentual = sem_uso
	tipo_inscricao_empresa_origem_dirigente_sindical = 1
	horas_mes = "220.00" # ESTUDAR PARA IMPLANTAR
	horas_semana = "44.00" # ESTUDAR PARA IMPLANTAR
	horas_dia = "7.33" # ESTUDAR PARA IMPLANTAR
	data_transf = sem_uso
	pis_domi_banc = sem_uso
	pis_num_banco = sem_uso
	pis_agencia = sem_uso
	pis_agencia_dv = sem_uso
	pis_end_banco = sem_uso
	dv_conta_corr = sem_uso
	possui_deficiencia_visual = 0
	possui_deficiencia_auditiva = 0
	possui_deficiencia_mental = 0
	deficiente_fisico = 0
	possui_deficiencia_motora = 0
	complemento = sem_uso
	naturalizado = sem_uso
	dcad_pis = sem_uso
	data_naturalizacao = sem_uso
	residencia_propria = 0
	possui_deficiencia_reabilitado = 0
	regime_casamento = sem_uso
	data_primeira_habilitacao_carteira_motorista = sem_uso
	uf_base_conta_fgts = sem_uso
	horas_compensadas = sem_uso
	nome_social = sem_uso
	aposentado = 0
	possui_deficiencia_intelectual = 0
	cota_deficiente = 0
	i_supervisor_estagio = sem_uso
	motivo_prorrogacao_contrato_experiencia = sem_uso
	descontar_estouro_rescisao_empresa_origem = 0
	descontar_contribuicao_sindical_a_partir_11_2017 = 0
	competencia_inicio_desconto_contribuicao_sindical_a_partir_11_2017 = sem_uso
	paga_contr_sind_11_2017 = "N"
	i_dados_evento_esocial = sem_uso
	i_lote_esocial = sem_uso
	status_esocial = sem_uso
	enviar_esocial = 1
	inclusao_validada_esocial = 0
	gerar_retificacao_esocial = 0
	codi_emp_esocial_s_2205 = sem_uso
	i_empregados_esocial_s_2205 = sem_uso
	i_dados_eventos_esocial_s_2205 = sem_uso
	i_lote_esocial_s_2205 = sem_uso
	status_esocial_s_2205 = sem_uso
	enviar_esocial_s_2205 = 1
	inclusao_validada_esocial_s_2205 = 0
	gerar_retificacao_esocial_s_2205 = 0
	i_dados_eventos_esocial_s_2206 = sem_uso
	i_lote_esocial_s_2206 = sem_uso
	status_esocial_s_2206 = sem_uso
	enviar_esocial_s_2206 = 1
	inclusao_validada_esocial_s_2206 = 0
	gerar_retificacao_esocial_s_2206 = 0
	excluir_evento_s_2205_retificacao = 0
	excluir_evento_s_2206_retificacao = 0
	lei_anistia_admissao = sem_uso
	data_efeito_reintegracao = sem_uso
	numero_processo_reintegracao = sem_uso
	codi_emp_reintegracao = sem_uso
	i_empregados_reintegracao = sem_uso
	enviar_s_2200_reintegracao = 0
	desligamento_realizado_mesmo_banco_reintegracao = 0
	desligamento_enviado_esocial_reintegracao = 0
	data_desligamento_reintegracao = sem_uso
	enviar_registro_apos_exclusao_esocial = 0
	transferido_com_empregados_origem_validado_no_esocial = 0
	enviar_cadastro_empregado_evento_s_1200_esocial = 0
	processar_exclusao_esocial = 0
	processar_exclusao_esocial_s_2205 = 0
	processar_exclusao_esocial_s_2206 = 0
	categoria_esocial = "NULO"
	
	# DADOS DO BANCO QUE NAO SERAO BUSCADOS DA TRON PARA O ARQUIVO DE BANCOS
	praca = sem_uso
	nome_agencia = sem_uso
	modelo_cheque = sem_uso
	dig_agencia = sem_uso
	
	# FOEMPREGADOS_DADOS_EVENTOS_ESOCIAL
	status_exclusao = 1
	reenviar_dados_eventos_exclusao = 0
}
{
	if(FNR == 1){
		for (c=1; c<=NF; c++)
			Coluna[$c] = c
		next
	}
	
	codi_emp = Campo("codi_emp")
	
	i_empregados = Campo("i_empregados")
	
	codigo_esocial = i_empregados
	
	admissao = Campo("admissao")
	
	vinculo = Campo("vinculo")
	
	# ESTAGIARIO
	if(vinculo == 50)
		i_instituicao_ensino = 1
	else
		i_instituicao_ensino = "NULO"
	
	i_sindicatos = Campo("i_sindicatos")
	
	opta_fgts = Campo("opta_fgts")
	
	opcao_fgts = Campo("opcao_fgts")
	
	oco_sefip = Campo("oco_sefip")
	
	data_base = Campo("data_base")
	
	venc_ferias = Campo("venc_ferias")
	
	i_cargos = Campo("i_cargos")
	
	i_depto = Campo("i_depto")
	
	i_ccustos = Campo("i_ccustos")
	
	i_jornada = Campo("i_jornada")
	
	i_servicos = Campo("i_servicos")
	
	categoria = Campo("categoria")
	
	numero_livro_registro = Campo("numero_livro_registro")
    
	numero_folha_livro_registro = Campo("numero_folha_livro_registro")
	
	possui_vinc_out_emp = Campo("possui_vinc_out_emp")
	
	ini_praz_det = Campo("ini_praz_det")
	
	fim_praz_det = Campo("fim_praz_det")
	
	contr_exper = Campo("contr_exper")
	
	pro_praz_det = Campo("pro_praz_det")
	
	quantidade_dias_contrato_experiencia = Campo("quantidade_dias_contrato_experiencia")
	
	quantidade_dias_prorrogacao_contrato_experiencia = Campo("quantidade_dias_prorrogacao_contrato_experiencia")
	
	tipo_cla_assc_dir_rec_res_ant = Campo("tipo_cla_assc_dir_rec_res_ant")
	
	conta_fgts = Campo("conta_fgts")
	
	forma_calculo = Campo("forma_calculo")
	
	salario = Campo("salario")
	
	nome = Campo("nome")
	
	endereco = Campo("endereco")
	
	numero_end = Campo("numero_end")
	
	bairro = Campo("bairro")
	
	cep = Campo("cep")
	
	cpf = Campo("cpf")
	
	municipio_nascimento = Campo("municipio_nascimento")
	
	uf_nascimento = Campo("uf_nascimento")
	
	municipio_endereco = Campo("municipio_endereco")
	
	estado = Campo("estado")
	
	email = Campo("email")
	
	email_alternativo = Campo("email_alternativo")
	
	tipo_endereco = Campo("tipo_endereco")
	
	data_nascimento = Campo("data_nascimento")
	
	sexo = Campo("sexo")
	
	estado_civil = Campo("estado_civil")
	
	cor = Campo("cor")
	
	grau_instrucao = Campo("grau_instrucao")
	
	nome_pai = Campo("nome_pai")
	
	nome_mae = Campo("nome_mae")
	
	pis = Campo("pis")
	
	identidade = Campo("identidade")
	
	dt_exp_ident = Campo("dt_exp_ident")
	
	org_exp_ident = Campo("org_exp_ident")
	
	orgao_expedicao_rg = Campo("orgao_expedicao_rg")
	
	uf_exp_ident = Campo("uf_exp_ident")
	
	titulo_eleit = Campo("titulo_eleit")
	
	secao_eleit = Campo("secao_eleit")
	
	zona_eleit = Campo("zona_eleit")
	
	categ_cart_mot = Campo("categ_cart_mot")
	
	cart_motorista = Campo("cart_motorista")
	
	venc_cart_mot = Campo("venc_cart_mot")
	
	data_expedicao_cnh = Campo("data_expedicao_cnh")
	
	cart_prof = Campo("cart_prof")
	
	serie_cart_prof = Campo("serie_cart_prof")
	
	dt_exp_cprof = Campo("dt_exp_cprof")
	
	uf_cart_prof = Campo("uf_cart_prof")
	
	possui_deficiencia = Campo("possui_deficiencia")
	
	orgao_emissor_cnh = Campo("orgao_emissor_cnh")
	
	codigo_uf_carteira_motorista = Campo("codigo_uf_carteira_motorista")
	
	data_chegada = Campo("data_chegada")
	
	casado_brasileiro = Campo("casado_brasileiro")
	
	filhos_brasileiro = Campo("filhos_brasileiro")
	
	ddd_fone = Campo("ddd_fone")
	
	fone = Campo("fone")
	
	ddd_celular = Campo("ddd_celular")
	
	celular = Campo("celular")
	
	cart_reservista = Campo("cart_reservista")
	
	numero_banco = Campo("numero_banco")
	
	agencia = Campo("agencia")
	
	nome_banco = Campo("nome_banco")
	
	indice_banco = numero_banco "-" agencia
	
	if( JaImprimiuBanco[indice_banco] == 0 && numero_banco != "NULO" ){
		i_bancos_cadastro++
		i_bancos_vetor[indice_banco] = i_bancos_cadastro
		
		agencia = IfElse( agencia == "NULO", 0, agencia )
		
		print i_bancos_cadastro, numero_banco, agencia, dig_agencia, nome_banco, praca, nome_agencia, modelo_cheque, origem_reg > "..\\prontos\\2_fobancos.csv"
		
		JaImprimiuBanco[indice_banco] = 1
	}
	
	# VOLTA A FAZER OS TRATAMENTOS DO ARQUIVO DE FUNCIONARIOS
	i_bancos = IfElse( numero_banco == ""  || numero_banco == "NULO" , "NULO", i_bancos_vetor[indice_banco] )
	
	if(i_bancos != "NULO"){
		tipo_conta = Campo("tipo_conta")
		
		conta_corr = Campo("conta_corr")
		
		forma_pagto = IfElse( conta_corr != "NULO", "C", "D" )
		
		digito_conta_pagamento = Campo("digito_conta_pagamento")
	}else{
		forma_pagto = "D"
		tipo_conta = sem_uso
		conta_corr = sem_uso
		digito_conta_pagamento = sem_uso
	}
	
	codigo_esocial = RetornaCodigoEsocial(codi_emp, "2200", i_empregados )
	codigo_esocial = IfElse( codigo_esocial == "NULO", i_empregados, codigo_esocial )
	
	if( vinculo != 50 ){
		i_dados_evento_esocial = RetornaILote(codi_emp, "2200", i_empregados )

		i_lote_esocial = i_dados_evento_esocial
		
		status_esocial = IfElse( i_lote_esocial == "NULO", "NULO", 3 )
		
		enviar_esocial = IfElse( i_lote_esocial == "NULO", 1, 0 )
		
		inclusao_validada_esocial = IfElse( i_lote_esocial == "NULO", 0, 1 )
		
		numero_recibo_validacao_utilitario_conversao_outro_banco = RetornaNumeroRecibo(codi_emp, "2200", i_empregados )
	} else {
		i_dados_evento_esocial = RetornaILote(codi_emp, "2300", i_empregados )

		i_lote_esocial = i_dados_evento_esocial
		
		status_esocial = IfElse( i_lote_esocial == "NULO", "NULO", 3 )
		
		enviar_esocial = IfElse( i_lote_esocial == "NULO", 1, 0 )
		
		inclusao_validada_esocial = IfElse( i_lote_esocial == "NULO", 0, 1 )
		
		numero_recibo_validacao_utilitario_conversao_outro_banco = RetornaNumeroRecibo(codi_emp, "2300", i_empregados )
	}
	
	gerar_retificacao_esocial = 0
	
	print codi_emp, i_empregados, i_filiais, i_horaemp, nome, pagou_cont_sindical, opta_fgts, categoria, horas_mes, horas_semana, horas_dia, admissao, salario, 
		  endereco, complemento, cep, cidade, fone, estado, data_nascimento, venc_ferias, i_ccustos, forma_pagto, sexo, local_nascimento,
		  uf_nascimento, estado_civil, nacionalidade, ano_chegada, identidade, naturalizado, pis, cpf, cart_prof, serie_cart_prof, opcao_fgts, conta_fgts, num_cart_ponto, venc_exame_medico,
		  vinculo, i_bancos, conta_corr, i_cargos, data_base, cart_motorista, categ_cart_mot, venc_cart_mot, data_transf, sai_rais,
		  grau_instrucao, i_depto, emprego_ant, nome_pai, nome_mae, uf_cart_prof, i_sindicatos, org_exp_ident, uf_exp_ident, dt_exp_ident, dt_exp_cprof,
		  tipo_visto_estrangeiro, validade_id_estr, validade_ctrab_estr, grupo_sanguineo, rh_sanguineo, nome_conjuge, ultimo_exame_medico, i_conselhos,
		  num_reg_cons_reg, regiao_reg_cons_regional, i_estabilidade, inicio_estabilidade, fim_estabilidade, i_localtrab, titulo_eleit, zona_eleit, secao_eleit,
		  dcad_pis, i_servicos, ini_praz_det, fim_praz_det, possui_vinc_out_emp, empresa_outro_vinc, codigo_vinc_outra_emp, ult_cont_sind, oco_sefip, cor,
		  cart_reservista, cate_reservista, i_niveis, i_clasniveis, i_refeniveis, matricula, deficiente_fisico, matric_inss, tipo_contrib, contrib_indiv,
		  inicio_contribuicao, classe_atual, data_classe, troca_aut_clas, evento_prolabore, gps_trimestral, gps_deducao, i_contribuintes, tipo_epr, usa_sist,
		  tempermuta, i_turmas, relogio1, relogio2, relogio3, relogio4, relogio5, aco_nao_aut, codigo_exportacao, transf_codi_emp, transf_i_empregados,
		  regime_trabalho, pis_domi_banc, pis_num_banco, pis_agencia, pis_agencia_dv, pis_end_banco, autoriza_tf, tipo_valor_tf,
		  valor_tf, data_emissao_tf, matricula_tf, bairro, sindicalizado, numero_end, imprime_recibo, origem_reg, fone2, tipo_servico, contr_exper,
		  pro_praz_det, contr_sobre_sal_min, contr_sobre_sal_min_data, simples_072007, data_calc_afastamentos, i_afastamentos, alvara_judicial,
		  i_operadoraplanosaude, plano_saude_optantes, opcao_plano_saude, tipo_cla_assc_dir_rec_res_ant, tipo_conta, data_reintegracao, tipo_inscricao_filial_origem,
		  inscricao_filial_origem, matricula_origem, nome_empresa_origem, email, numero_processo_mte, data_chegada, data_naturalizacao, casado_brasileiro,
		  filhos_brasileiro, nif, numero_ric, orgao_emissor_ric, local_ric, data_expedicao_ric, data_validade_ric, digito_conta_pagamento, residente_exterior,
		  tipo_endereco, municipio_endereco, municipio_nascimento, pais_endereco, pais_nascimento, beneficiado_pat, contr_sobre_sal_min_tipo, 
		  gps_conjunta_novembro_13_integral, gps_conjunta_novembro_13_integral_inicio, beneficiado_pat_servico_proprio, beneficiado_pat_administracao_cozinhas,
		  beneficiado_pat_refeicao_convenio, beneficiado_pat_refeicoes_transportadas, beneficiado_pat_cesta_alimentos, beneficiado_pat_alimentacao_convenio,
		  atividade_conta_propria_rural, numero_passaporte, emissor_passaporte, uf_passaporte, data_emissao_passaporte, data_validade_passaporte, pais_passaporte,
		  tipo_indicativo_admissao, nome_municipio_residente_exterior, pais_nacionalidade, data_expedicao_cnh, orgao_emissor_cnh, codigo_postal, residencia_propria,
		  utilizou_recurso_fgts, email_alternativo, tipo_processo_alvara, autoria_alvara, numero_alvara, indicativo_decisao_alvara, data_decisao_alvara,
		  montante_integral_depositado_alvara, inicio_vigencia_alvara, fim_vigencia_alvara, identificacao_alvara, codigo_municipio_alvara, possui_deficiencia, possui_deficiencia_motora,
		  possui_deficiencia_visual, possui_deficiencia_auditiva, possui_deficiencia_outras, possui_deficiencia_reabilitado, observacao_deficiencia, i_funcao, numero_rne, data_expedicao_rne, 
		  orgao_emissor_rne, endereco_comercial, i_processo, codigo_sce_dominio_atendimento, i_instituicao_ensino, i_agentes_integracao, i_coordenador_estagio,
		  area_atuacao_estagiario, natureza_estagio, nivel_estagio, apolice_seguro_estagiario, possui_deficiencia_mental, i_jornada, situacao_qualificacao_cadastral_inss_receita_federal,
		  caixa_postal, cep_caixa_postal, motivo_contratacao_trabalho_temporario, nome_trabalhador_substituido_trabalho_temporario, cpf_trabalhador_substituido_trabalho_temporario,
		  matricula_trabalhador_substituido_trabalho_temporario, tipo_horario, codigo_esocial, i_remuneracao_variavel, i_processo_reintegracao, 
		  possui_reducao_aliquota_inss, possui_reducao_aliquota_inss_competencia, quantidade_dias_contrato_experiencia, quantidade_dias_prorrogacao_contrato_experiencia,
		  recebia_seguro_desemprego, natureza_trabalho_autonomo, ddd_fone, ddd_fone2, ddd_celular, celular, ddd_contato_2, contato_2, inscricao_municipal_autonomo,
		  regime_casamento, dirigente_sindical, cnpj_empresa_origem_dirigente_sindical, nome_empresa_origem_dirigente_sindical, categoria_origem_dirigente_sindical,
		  data_admissao_empresa_origem_dirigente_sindical, matricula_empresa_origem_dirigente_sindical, responsavel_remuneracao_dirigente_sindical,
		  tipo_remuneracao_dirigente_sindical, data_inicio_pagamento_adicional_dirigente_sindical, remuneracao_sindicato_dirigente_sindical,
		  remuneracao_empresa_dirigente_sindical, orgao_expedicao_rg, forma_calculo, usa_salario_minimo_estadual, i_tabcalc_salario_minimo_estadual,
		  i_categoria_salario_minimo_estadual, empresa_origem_desonerada, remuneracao_periodo_desligamento_reintegracao_pagas_juizo,
		  codigo_municipio_ric, codigo_uf_carteira_motorista, data_primeira_habilitacao_carteira_motorista, brasileiro_nascido_exterior, calcular_inss_patronal,
		  carga_horaria_variavel, data_operacao_conectivade_social, chave_identificacao_conectivade_social, data_real_dn_afastamento_da, calcular_adiantamento_salarial,
		  calculo_adiantamento_salarial_percentual, tipo_inscricao_empresa_origem_dirigente_sindical, uf_base_conta_fgts, horas_compensadas, numero_livro_registro,
          numero_folha_livro_registro, nome_social, aposentado, possui_deficiencia_intelectual, cota_deficiente, i_supervisor_estagio, motivo_prorrogacao_contrato_experiencia,
		  descontar_estouro_rescisao_empresa_origem, descontar_contribuicao_sindical_a_partir_11_2017, competencia_inicio_desconto_contribuicao_sindical_a_partir_11_2017,
 		  paga_contr_sind_11_2017, i_dados_evento_esocial, i_lote_esocial, status_esocial, enviar_esocial, inclusao_validada_esocial, gerar_retificacao_esocial,
		  codi_emp_esocial_s_2205, i_empregados_esocial_s_2205, i_dados_eventos_esocial_s_2205, i_lote_esocial_s_2205, status_esocial_s_2205, enviar_esocial_s_2205,
		  inclusao_validada_esocial_s_2205, gerar_retificacao_esocial_s_2205, i_dados_eventos_esocial_s_2206, i_lote_esocial_s_2206, status_esocial_s_2206, enviar_esocial_s_2206, 
		  inclusao_validada_esocial_s_2206, gerar_retificacao_esocial_s_2206, excluir_evento_s_2205_retificacao, excluir_evento_s_2206_retificacao, lei_anistia_admissao,
		  data_efeito_reintegracao, numero_processo_reintegracao, codi_emp_reintegracao, i_empregados_reintegracao, enviar_s_2200_reintegracao,
		  desligamento_realizado_mesmo_banco_reintegracao, desligamento_enviado_esocial_reintegracao, data_desligamento_reintegracao, enviar_registro_apos_exclusao_esocial,
		  transferido_com_empregados_origem_validado_no_esocial, enviar_cadastro_empregado_evento_s_1200_esocial, processar_exclusao_esocial, processar_exclusao_esocial_s_2205,
		  processar_exclusao_esocial_s_2206, categoria_esocial, numero_recibo_validacao_utilitario_conversao_outro_banco
		  
	# GERA O ARQUIVO FOEMPREGADOS_DADOS_EVENTOS_ESOCIAL
	if( i_dados_evento_esocial != "NULO" )
		print codi_emp, i_empregados, i_dados_evento_esocial, status_exclusao, codi_emp, i_empregados, reenviar_dados_eventos_exclusao > "..\\temp\\foempregados_dados_eventos_esocial.csv"
	
	
}