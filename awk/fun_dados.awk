BEGIN {
	FS = ";"; 
	OFS = FS;
	print "codi_pessoa", "data_nascimento", "sexo", "estado_civil", "cor", "grau_instrucao", "nome_pai", "nome_mae", "pis", "identidade", "dt_exp_ident", "org_exp_ident", 
          "orgao_expedicao_rg", "uf_exp_ident", "titulo_eleit", "secao_eleit", "zona_eleit", "categ_cart_mot", "cart_motorista", "venc_cart_mot", "cart_prof", "serie_cart_prof", 
		  "dt_exp_cprof", "uf_cart_prof", "possui_deficiencia", "orgao_emissor_cnh", "codigo_uf_carteira_motorista", "data_chegada", "casado_brasileiro", "filhos_brasileiro",
		  "data_expedicao_cnh", "cart_reservista"
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
	
	tipo = Campo("TIPPESEPG")
	tipo = Trim(tipo)
	tipo = upperCase(tipo)
		
	cod_pes = Campo("CODPESEPG")
	cod_pes = soNumeros(cod_pes)
	
	data_nascimento = Campo("DTANSCPES")
	data_nascimento = Trim(data_nascimento)
	data_nascimento = FormatDate(data_nascimento, "-", "US")
	data_nascimento = isDate(data_nascimento)

	sexo = Campo("SEXPES")
	sexo = Trim(sexo)
	sexo = upperCase(sexo)
		
	estado_civil = Campo("ESTCIVPES")
	estado_civil = Trim(estado_civil)
	estado_civil = estadoCivilFuncionario(estado_civil)
	
	cor = Campo("RACPES")
	cor = soNumeros(cor)
	if (cor == 0)
		cor = 9 # NAO INFORMADO
	else if (cor == 1)
		cor = 0 # BRANCO
	else
		cor = cor
	
	# TODOS GRAU DE INSTRUCAO EH IGUAL AO DOMINIO
    grau_ins = Campo("GRAINSPES")
	grau_ins = Trim(grau_ins)
	if (grau_ins == 0) 
		grau_ins = 7
	else
		grau_ins = grau_ins
		
	pai = Campo("PAIEPG")
	pai = Trim(pai)
	pai = upperCase(pai)
			
	mae = Campo("MAEEPG")
	mae = Trim(mae)
	mae = upperCase(mae)
		
	pis = Campo("PISPASEPG")
	pis = soNumeros(pis)
	
	rg = Campo("CARIDEEPG")
	rg = Trim(rg)
	rg = upperCase(rg)
		
	dt_exp_ident = Campo("DTAEXPIDEEMP")
	dt_exp_ident = Trim(dt_exp_ident)
	dt_exp_ident = FormatDate(dt_exp_ident, "-", "US")
	dt_exp_ident = isDate(dt_exp_ident)
	
	org_exp_ident = Campo("ORGEXPIDEEPG")
	org_exp_ident = Trim(org_exp_ident)
	
	orgao_expedicao_rg = orgaoExpIdentidade(org_exp_ident)
		
	uf_rg = Campo("CODUNDFEDORGEXPEPG")
	uf_rg = Trim(uf_rg)
		
	titulo = Campo("TITELEEPG")
	titulo = Trim(titulo)
		
	secao = Campo("SECTITELEEPG")
	secao = Trim(secao)
		
	zona = Campo("ZONTITELEEPG")
	zona = Trim(zona)
		
	categ_cnh = Campo("CARCNHEPG")
	categ_cnh = Trim(categ_cnh)
	categ_cnh = upperCase(categ_cnh)
		
	num_cnh = Campo("REGCNHEPG")
	num_cnh = Trim(num_cnh)
	
	data_expedicao_cnh = Campo("DTAEMICNHEPG")
	data_expedicao_cnh = Trim(data_expedicao_cnh)
	data_expedicao_cnh = FormatDate(data_expedicao_cnh, "-", "US")
	data_expedicao_cnh = isDate(data_expedicao_cnh)
		
	venc_cnh = Campo("DTAVENCNHEPG")
	venc_cnh = Trim(venc_cnh)
	venc_cnh = FormatDate(venc_cnh, "-", "US")
	venc_cnh = isDate(venc_cnh)
		
	cart_prof = Campo("CTPEPG")
	cart_prof = soNumeros(cart_prof)
	
	serie_cart_prof = Campo("SERCTPEPG")
	serie_cart_prof = Trim(serie_cart_prof)
	if ( length(serie_cart_prof) == 5 ) 
		serie_cart_prof = serie_cart_prof
	else if ( length(serie_cart_prof) == 4 ) 
		serie_cart_prof = "0" serie_cart_prof
	else if ( length(serie_cart_prof) == 3 ) 
		serie_cart_prof = "00" serie_cart_prof
	else if ( length(serie_cart_prof) == 2 ) 
		serie_cart_prof = "000" serie_cart_prof
	else if ( length(serie_cart_prof) == 1 ) 
		serie_cart_prof = "0000" serie_cart_prof
	else
		serie_cart_prof = "NULO"
	
	dt_exp_cprof = Campo("DTAEXPCTPEPG")
	dt_exp_cprof = Trim(dt_exp_cprof)
	dt_exp_cprof = FormatDate(dt_exp_cprof, "-", "US")
	dt_exp_cprof = isDate(dt_exp_cprof)
		
	uf_cart_prof = Campo("CODUNDFEDCTPEPG")
	uf_cart_prof = Trim(uf_cart_prof)
	uf_cart_prof = upperCase(uf_cart_prof)
	
	deficiente = Campo("DEFFISEPG")
	deficiente = Trim(deficiente)
	deficiente = upperCase(deficiente)
	if(deficiente == "S")
		deficiente = "1"
	else
		deficiente = "0"
	
	# TIPDEFFISEPG --> VERIFICAR ALGUM EMPREGADO QUE POSSUI PRA AVALIAR QUAL TIPO DE DEFIENCIA EH
	# IMPLEMENTAR PARA IMPORTAR CERTIDOES CIVIS PARA EMPREGADOS QUE POSSUIREM
	
	orgao_emissor_cnh = Campo("ORGEXPCNHEPG")
	orgao_emissor_cnh = Trim(orgao_emissor_cnh)
	orgao_emissor_cnh = upperCase(orgao_emissor_cnh)
	
	uf_emissor_cnh = Campo("CODUNDFEDORGEXPCNH")
	uf_emissor_cnh = Trim(uf_emissor_cnh)
	uf_emissor_cnh = upperCase(uf_emissor_cnh)
	if( ( uf_emissor_cnh == "NULO" || uf_emissor_cnh == "" ) && num_cnh != "NULO" && num_cnh != "" )
		uf_emissor_cnh = "GO"
	else
		uf_emissor_cnh = uf_emissor_cnh
	uf_emissor_cnh = RetornaCodiEstado(uf_emissor_cnh)
	
	data_chegada = Campo("DTACHEPES")
	data_chegada = Trim(data_chegada)
	data_chegada = FormatDate(data_chegada, "-", "US")
	data_chegada = isDate(data_chegada)
	
	qtd_filho_com_brasileiro = Campo("QTDFILBRAPES")
	qtd_filho_com_brasileiro = soNumeros(qtd_filho_com_brasileiro)
	qtd_filho_com_brasileiro = FormataCampo("integer", qtd_filho_com_brasileiro, 15, 0)
	
	if(qtd_filho_com_brasileiro != "NULO")
		casado_com_brasileiro = "1"
	else
		casado_com_brasileiro = "0"
	
	if(qtd_filho_com_brasileiro != "NULO")
		filho_com_brasileiro = "1"
	else
		filho_com_brasileiro = "0"
	
	cart_reservista = Campo("RESEPG")
	cart_reservista = Trim(cart_reservista)
	cart_reservista = upperCase(cart_reservista)
	cart_reservista = isNull(cart_reservista)
	
	print cod_pes, data_nascimento, sexo, estado_civil, cor, grau_ins, pai, mae, pis, rg, dt_exp_ident, org_exp_ident, orgao_expedicao_rg, uf_rg, titulo, secao, zona, 
	      categ_cnh, num_cnh, venc_cnh, cart_prof, serie_cart_prof, dt_exp_cprof, uf_cart_prof, deficiente, orgao_emissor_cnh, uf_emissor_cnh, data_chegada,
		  casado_com_brasileiro, filho_com_brasileiro, data_expedicao_cnh, cart_reservista
	
}