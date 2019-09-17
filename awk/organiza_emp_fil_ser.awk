BEGIN { 
	FS = ";"; 
	OFS = FS;
	sem_uso = "NULO";
	
	# CAMPOS COM VALORES FIXOS E NÃO SERÃO BUSCADOS DA TRON
	cida_emp = sem_uso
	codi_mun = sem_uso
	dina_emp = sem_uso
	dcad_emp = "01/01/2017"
	sele_emp = sem_uso
	codi_cla = sem_uso
	ucxa_emp = sem_uso
	uhon_emp = sem_uso
	upat_emp = sem_uso
	ulal_emp = sem_uso
	uatu_emp = sem_uso
	upro_emp = sem_uso
	ccae_emp = sem_uso
	isub_emp = sem_uso
	empreg_emp = sem_uso
	vlfat_emp = sem_uso
	vlhon_emp = sem_uso
	codm_leg_emp = sem_uso
	livro_cart_emp = sem_uso
	folha_cart_emp = sem_uso
	nliv_cart_emp = sem_uso
	soc_civis_emp = sem_uso
	cfdf_emp = sem_uso
	simples_emp = sem_uso
	dsimples_emp = sem_uso
	munirais_emp = sem_uso
	rfed_emp = sem_uso
	upto_emp = 0
	comp_leg_emp = sem_uso
	i_classificacoes = sem_uso
	ctahono_emp = sem_uso
	caedesm_emp = sem_uso
	nome_cartorio_emp = ""
	selehono_emp = sem_uso
	origem_reg = 1
	foro_emp = sem_uso
	obj_social_emp = sem_uso
	pais_emp = sem_uso
	duracao_emp = "I"
	data_cart = sem_uso
	dttermino_emp = sem_uso
	ureg_emp = sem_uso
	tipoi_emp = sem_uso
	codigo_pais = 30
	insc_suframa = sem_uso
	upto_tec_emp = 0
	observao_emp = sem_uso
	caixa_postal_emp = sem_uso
	usa_dominio_web = sem_uso
	certificado_digital = "N"
	site_emp = sem_uso
	qualificacao_leg_emp = 999
	honorario_tipo = "C"
	cnae_20_desmenbramento = sem_uso
	tipo_registro = "C"
	identificacao_livro_demonstrativo = "E"
	data_emissao_leg_emp = sem_uso
	identidade_profissional_leg_emp = sem_uso
	codigo_municipio_cartorio = sem_uso
	nacionalidade_leg_emp = "BRASILEIRO(A)"
	estaco_civil_leg_emp = 2
	gerar_integra = "N"
	obs_geral = sem_uso
	obs_societario = sem_uso
	obs_fiscal = sem_uso
	obs_pessoal = sem_uso
	responsavel_legal_empresa_junto_base_rfb = "N"
	
	# DADOS FIXOS DAS FILIAIS
	i_filiais = 1
	cidade = sem_uso
	i_municipio = sem_uso
	i_sindicatos_p = sem_uso
	sind_centralizador = sem_uso
	sind_capital_social = sem_uso
	cnpj_centralizador = sem_uso
	sindicalizada = "N"
	codi_emp_atendimento = sem_uso
	permite_cadastrar_empregados_dominio_atendimento = 0
	centralizacao_eventos_esocial = 2
	possui_estabelecimentos_outro_banco_dados = 0
	todas_filiais_centralizadas_possuem_mesma_tabela_rubricas = 0
	possui_empresa_centralizadora_rubricas_esocial_outro_banco_dados = 0
	identificador_tabela_rubricas_esocial = sem_uso
	
	# DADOS DA TABELA FOSERVICOS
	i_servicos = 1
	situacao = 1
	data_inativacao = sem_uso
	codigo_esocial = i_servicos
	
	# DADOS DA TABELA FOVIGENCIAS_SERVICOS	
	descricao = "VIGENCIA CONVERSAO"
	codigo_terceiro = 0
	perc_terceiro = 0
	perc_inss_empresa = 0
	perc_acid_trabalho = 0
	codigo_sat = 0
	perc_autonomos = 0
	codigo_atividade = 0
	i_bancos = sem_uso
	numero_fgts = 0
	cidade = sem_uso
	i_filiais = 1
	sequencia_gps = 1
	filantropia = sem_uso
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
	tipo_lotacao_esocial = sem_uso
	i_processo_terceiros = sem_uso
	caepf = sem_uso
	tipo_caepf = sem_uso
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
	
	codi_emp = $1
	
	razao_emp = Campo("nome_emp")
	
	tins_emp = Campo("tins_emp")
	
	cgce_emp = Campo("cgce_emp")
	
	dtinicio_emp = Campo("dtinicio_emp")
	
	codigo_municipio = Campo("codigo_municipio")
	
	esta_emp = Campo("esta_emp")
	
	njud_emp = Campo("njud_emp")
	
	imun_emp = Campo("imun_emp")
	
	iest_emp = Campo("iest_emp")
	
	ijuc_emp = Campo("ijuc_emp")
	
	djuc_emp = Campo("djuc_emp")
	
	cnae_emp = Campo("cnae_emp")
	
	i_cnae20 = Campo("i_cnae20")
	
	ramo_emp = Campo("ramo_emp")
	
	if (i_cnae20 == "NULO") 
		usa_cnae20 = "N"
	else 
		usa_cnae20 = "S"
	
	stat_emp = Campo("stat_emp")
	
	codi_con = Campo("codi_con")
	
	codigo_fpas = Campo("codi_fpas")
	
	codigo_gfip = Campo("codigo_gfip")
	
	codigo_gps = Campo("codi_gps")
	
	perc_acid_trabalho = Campo("perc_acid_trabalho")
	
	perc_autonomos = Campo("perc_autonomos")
	
	perc_inss_empresa = Campo("perc_inss_empresa")
	
	codigo_terceiro = Campo("codigo_terceiro")
	
	perc_terceiro = Campo("perc_terceiro")
	
	percentual_terceiro_bruto = perc_terceiro
	
	fantasia_emp = Campo("fantasia_emp")
	if (fantasia_emp == "" || fantasia_emp == "NULO")
		fantasia_emp = GeraApelido(razao_emp, 50)
	else
		fantasia_emp = fantasia_emp
	
	nome_emp = GeraApelido(razao_emp, 40)
	
	apel_emp = fantasia_emp
	
	ende_emp = Campo("ende_emp")
	
	nume_emp = Campo("nume_emp")
	
	bair_emp = Campo("bair_emp")
	
	email_emp = Campo("email_emp")
	
	cepe_emp = Campo("cepe_emp")
	
	comp_emp = Campo("comp_emp")
	
	tipo_end_emp = Campo("tipo_end_emp")
	
	ufol_emp = Campo("ufol_emp")
	
	uefi_emp = Campo("uefi_emp")
	
	ucta_emp = Campo("ucta_emp")
	
	dddf_emp = Campo("dddf_emp")
	
	fone_emp = Campo("fone_emp")
	
	fax_emp = Campo("fax_emp")
	
	cpf_leg_emp = Campo("cpf_leg_emp")
	
	rleg_emp = Campo("rleg_emp")
	
	end_leg_emp = Campo("end_leg_emp")
	
	nume_leg_emp = Campo("nume_leg_emp")
	
	bair_leg_emp = Campo("bair_leg_emp")
	
	mun_leg_emp = Campo("mun_leg_emp")
	
	uf_leg_emp = Campo("uf_leg_emp")
	
	cep_leg_emp = Campo("cep_leg_emp")
	
	profissao_leg_emp = Campo("profissao_leg_emp")
	
	email_leg_emp = Campo("email_leg_emp")
	
	rg_resp_emp = Campo("rg_resp_emp")
	
	orgao_emissor_leg_emp = Campo("orgao_emissor_leg_emp")
	
	uf_emissao_resp = Campo("uf_emissao_resp")
	
	dddf_leg_emp = Campo("dddf_leg_emp")
	
	fone_leg_emp = Campo("fone_leg_emp")
	
	i_dados_evento_esocial = RetornaILote_2(codi_emp, "1000" )
	
	i_dados_evento_esocial_2 = RetornaILote_4(cgce_emp, "1005" )
	
	i_dados_evento_esocial = IfElse( i_dados_evento_esocial == "NULO", i_dados_evento_esocial_2, i_dados_evento_esocial )
	
	i_lote_esocial = i_dados_evento_esocial
	
	status_esocial = IfElse( i_lote_esocial == "NULO", "NULO", 3 )
	
	enviar_esocial = IfElse( i_lote_esocial == "NULO", 1, 0 )
	
	inclusao_validada_esocial = IfElse( i_lote_esocial == "NULO", 0, 1 )
	
	gerar_retificacao_esocial = 0
	
	i_dados_evento_esocial_s_1005 = RetornaILote_4(cgce_emp, "1005" )
	
	i_lote_esocial_s_1005 = i_dados_evento_esocial_s_1005
	
	status_esocial_s_1005 = IfElse( i_lote_esocial_s_1005 == "NULO", "NULO", 3 )
	
	enviar_esocail_s_1005 = IfElse( i_lote_esocial_s_1005 == "NULO", 1, 0 )
	
	inclusao_validada_esocial_s_1005 = IfElse( i_lote_esocial_s_1005 == "NULO", 0, 1 )
	
	gerar_retificao_esocial_s_1005 = 0
	
	i_dados_evento_esocial_s_1020 = RetornaILote_4(cgce_emp, "1020" )
	
	i_lote_esocial_s_1020 = i_dados_evento_esocial_s_1020
	
	status_esocial_s_1020 = IfElse( i_lote_esocial_s_1020 == "NULO", "NULO", 3 )
	
	enviar_esocail_s_1020 =  IfElse( i_lote_esocial_s_1020 == "NULO", 1, 0 )
	
	inclusao_validada_esocial_s_1020 =  IfElse( i_lote_esocial_s_1020 == "NULO", 0, 1 )
	
	gerar_retificao_esocial_s_1020 = 0
	
	codigo_esocial = RetornaCodigoEsocial_3( cgce_emp, "1020" )
	codigo_esocial = IfElse( codigo_esocial == "NULO", 1, codigo_esocial )
	
	i_cnae_esocial = RetornaCodigoCnaeEsocial( i_cnae20 )
	
	print codi_emp, nome_emp, ende_emp, cepe_emp, cida_emp, cgce_emp, iest_emp, imun_emp, ijuc_emp, bair_emp, ramo_emp, apel_emp, codi_mun, nume_emp, djuc_emp, fone_emp,
	      rleg_emp, esta_emp, tins_emp, stat_emp, dina_emp, dcad_emp, sele_emp, codi_cla, ucta_emp, ucxa_emp, uhon_emp, uefi_emp, upat_emp, ulal_emp, uatu_emp, upro_emp,
		  ccae_emp, isub_emp, empreg_emp, vlfat_emp, vlhon_emp, cpf_leg_emp, end_leg_emp, mun_leg_emp, uf_leg_emp, cep_leg_emp, njud_emp, comp_emp, nume_leg_emp,
          bair_leg_emp, codm_leg_emp, fone_leg_emp, cnae_emp, dddf_emp,	codi_con, cargo_leg_emp, dddf_leg_emp, livro_cart_emp, folha_cart_emp, nliv_cart_emp, soc_civis_emp,
		  cfdf_emp, simples_emp, dsimples_emp, munirais_emp, rfed_emp, ufol_emp, upto_emp, comp_leg_emp, email_emp, i_classificacoes, ctahono_emp, rg_resp_emp, caedesm_emp,
		  nome_cartorio_emp, selehono_emp, origem_reg, fantasia_emp, foro_emp, obj_social_emp, dtinicio_emp, pais_emp, duracao_emp, data_cart, dttermino_emp, fax_emp, ureg_emp,
		  razao_emp, tipoi_emp, tipo_end_emp, codigo_pais, codigo_municipio, insc_suframa, i_cnae20, usa_cnae20, email_leg_emp, upto_tec_emp, observao_emp, uf_emissao_resp,
		  caixa_postal_emp, usa_dominio_web, certificado_digital, site_emp, qualificacao_leg_emp, honorario_tipo, cnae_20_desmenbramento, tipo_registro,
		  identificacao_livro_demonstrativo, orgao_emissor_leg_emp, data_emissao_leg_emp, identidade_profissional_leg_emp, codigo_municipio_cartorio, profissao_leg_emp,
		  nacionalidade_leg_emp, estaco_civil_leg_emp, gerar_integra, obs_geral, obs_societario, obs_contabil, obs_fiscal, obs_pessoal, responsavel_legal_empresa_junto_base_rfb,
		  i_dados_evento_esocial, i_lote_esocial, status_esocial, enviar_esocial, inclusao_validada_esocial, gerar_retificacao_esocial
		  
	if (ufol_emp == 1) {
		
		telefone = Ddd_Fone_Filiais(dddf_emp, fone_emp)
		
		print codi_emp, i_filiais, nome_emp, ende_emp, nume_emp, comp_emp, cidade, esta_emp, cepe_emp, tins_emp, cgce_emp, iest_emp, telefone, cnae_emp, i_municipio,
		      bair_emp, origem_reg, codigo_municipio, i_cnae20, i_sindicatos_p, sind_centralizador, sind_capital_social, cnpj_centralizador, sindicalizada,
			  codi_emp_atendimento, permite_cadastrar_empregados_dominio_atendimento, centralizacao_eventos_esocial, possui_estabelecimentos_outro_banco_dados,
			  razao_emp, tipo_end_emp, todas_filiais_centralizadas_possuem_mesma_tabela_rubricas, possui_empresa_centralizadora_rubricas_esocial_outro_banco_dados,
			  identificador_tabela_rubricas_esocial > "..\\temp\\filiais.csv"
		
		print codi_emp, i_servicos, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, nome_emp,
		      sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, sem_uso, origem_reg, sem_uso, sem_uso, sem_uso, sem_uso, dtinicio_emp, situacao,
			  data_inativacao, codigo_esocial, i_dados_evento_esocial_s_1005, i_lote_esocial_s_1005, status_esocial_s_1005, enviar_esocail_s_1005, inclusao_validada_esocial_s_1005, 
			  gerar_retificao_esocial_s_1005 > "..\\temp\\foservicos.csv"
			  
		# DADOS DA TABELA FOVIGENCIAS_SERVICOS
		tipo_endereco = tpEnderecoServico(ende_emp)
		
		print codi_emp, i_servicos, dtinicio_emp, descricao, cgce_emp, tins_emp, codigo_terceiro, perc_terceiro, perc_inss_empresa, perc_acid_trabalho, codigo_sat,
		      perc_autonomos, codigo_fpas, codigo_atividade, codigo_gfip, codigo_gps, i_bancos, numero_fgts, ende_emp, nume_emp, bair_emp, cepe_emp, cidade, esta_emp,
			  i_filiais, sequencia_gps, filantropia, origem_reg, tipo, codi_mun, codigo_municipio, i_fpas, calcula_inss_empresa_lei_12546, tipo_servico_tomador,
			  tipo_endereco, comp_emp, tipo_inscricao_contratante_empreitada_parcial, inscricao_contratante_empreitada_parcial, nome_contratante_empreitada_parcial,
			  tipo_inscricao_proprietario_cei_empreitada_parcial, inscricao_proprietario_cei_empreitada_parcial, nome_proripeitario_cei_empreitada_parcail, i_cnae20,
			  tipo_informacao_aliquota_acidente_trabalho, i_processo, i_scp, dddf_emp, fone_emp, competencia_fim_vigencia, tipo_lotacao_esocial, i_processo_terceiros,
			  caepf, tipo_caepf, registro_ponto, contrato_aprendiz, i_processo_contratao_aprendiz, realiza_contratao_aprendiz_intermedio_entidade_educativa_sem_fins_lucrativos,
			  codigo_suspensao_processo_rat, soma_codigos_suspensao_terceiros, percentual_terceiro_bruto, i_dados_evento_esocial_s_1005, i_lote_esocial_s_1005, status_esocial_s_1005, 
		      enviar_esocail_s_1005, inclusao_validada_esocial_s_1005, gerar_retificao_esocial_s_1005, i_dados_evento_esocial_s_1020, i_lote_esocial_s_1020, status_esocial_s_1020, 
		      enviar_esocail_s_1020, inclusao_validada_esocial_s_1020, gerar_retificao_esocial_s_1020, i_cnae_esocial, i_terceiros > "..\\temp\\fovigencias_servico.csv"
			  
	}
	
	# GERA ARQUIVO DE EMPRESAS A SE ENVIAR PRO CLIENTE PARA SER FEITO O FILTRO POR ELE
	cnpj_cpf = MontaCPF_CNPJ(cgce_emp, tins_emp)
	print codi_emp, razao_emp, cnpj_cpf, "" > "..\\awk\\empresas_converter_original.txt"
	
	#if( stat_emp == "I" )
	#	print codi_emp, razao_emp, cnpj_cpf, "" > "..\\awk\\empresas_inativas.txt"
	#else
	#	print codi_emp, razao_emp, cnpj_cpf, "" > "..\\awk\\empresas_ativas.txt"

}
function GeraApelido(GaEntrada, GaTamanho) {
	GaApelido = ""
	if (GaEntrada == "")
		return ""
	else if (length(GaEntrada) <= GaTamanho)
		return GaEntrada
	else {
		GaCaracterAntes = substr(GaEntrada, GaTamanho, 1)
		GaCaracterDepois = substr(GaEntrada, GaTamanho + 1, 1)
		if ((GaCaracterAntes != " ")&&(GaCaracterDepois != " ")) {
			for (Ga1=GaTamanho; Ga1>=0; Ga1--) {
				Ga1Caracter = substr(GaEntrada, Ga1, 1)
				if (Ga1Caracter == " ") {
					GaApelido = substr(GaEntrada, 1, Ga1)
					break
				}
			}
		} else
			GaApelido = substr(GaEntrada, 1, GaTamanho)
		
		gsub(/[ ]*$|^[ ]*/, "", GaApelido)
		Ga1Temp1 = substr(GaApelido, length(GaApelido) - 2, 3)
		if ((Ga1Temp1 == " DA")||(Ga1Temp1 == " DE")||(Ga1Temp1 == " DI")||(Ga1Temp1 == " DO")||(Ga1Temp1 == " DU")) {
			GaApelido = substr(GaApelido, 1, length(GaApelido) - 3)
			gsub(/[ ]*$|^[ ]*/, "", GaApelido)
		}
		Ga1Temp2 = substr(GaApelido, length(GaApelido) - 1, 2)
		if ((Ga1Temp2 == " A")||(Ga1Temp2 == " E")||(Ga1Temp2 == " I")||(Ga1Temp2 == " O")||(Ga1Temp2 == " U")||(Ga1Temp2 == " -")) {
			GaApelido = substr(GaApelido, 1, length(GaApelido) - 2)
			gsub(/[ ]*$|^[ ]*/, "", GaApelido)
		}
		if (GaApelido == "")
			GaApelido = substr(GaEntrada, 1, GaTamanho)
	}
	return GaApelido
}