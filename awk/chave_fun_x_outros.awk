BEGIN{
	FS = ";";
	
	# --------- DEPARTAMENTOS ------------
	ArquivoDepto = "..\\temp\\deptos.csv"
	while((getline < ArquivoDepto) > 0){
		codi_emp_depto = $1
		codi_depto = $2
		
		# Cria o vetor que vai receber o código do departamento
		CodiDepto[codi_emp_depto "-" codi_depto] = codi_depto
	} close(ArquivoDepto)
	
	# --------- CARGOS ------------ 
	ArquivoCargo = "..\\temp\\cargos.csv"
	while((getline < ArquivoCargo) > 0){
		codi_emp_cargo = $1
		codi_cargo = $2
		
		# Cria o vetor que vai receber o código do cargo
		CodiCargo[codi_emp_cargo "-" codi_cargo] = codi_cargo
	} close(ArquivoCargo)
	
	# ---------- SINDICATOS ------------
	ArquivoSindicato = "..\\prontos\\2_fosindicatos.csv"
	while((getline < ArquivoSindicato) > 0){
		codi_sindicato = $2
		
		# Cria o vetor que vai receber o código do sindicato
		CodiSindicato[codi_sindicato] = codi_sindicato
	} close(ArquivoSindicato)
	
	# --------- JORNADAS --------------
	ArquivoJornada = "..\\temp\\fojornadas.csv"
	while((getline < ArquivoJornada) > 0){
		codi_emp_jornada = $1
		codi_jornada = $2
		
		# Cria o vetor que vai receber o código da jornada
		CodiJornada[codi_emp_jornada "-" codi_jornada] = codi_jornada
	} close(ArquivoJornada)
	
	# --------- CENTRO DE CUSTOS --------------
	ArquivoCCustos = "..\\temp\\ccustos.csv"
	while((getline < ArquivoCCustos) > 0){
		codi_emp_ccusto = $1
		codi_ccusto = $2
		
		# Cria o vetor que vai receber o código do cargo
		CodiCCusto[codi_emp_ccusto "-" codi_ccusto] = codi_ccusto
	} close(ArquivoCCustos)
	
	# --------- ULTIMO CODIGO FUNCIONARIO --> USADO PARA CONTRIBUINTES --------------
	ArquivoUltCodFun = "..\\temp\\fun_maior_codigo.csv"
	while((getline < ArquivoUltCodFun) > 0){
		codi_emp_ultcodfun = $1
		ult_cod_fun = $2
		
		# Cria o vetor que vai receber o código da jornada
		UltCodFun[codi_emp_ultcodfun] = ult_cod_fun
	} close(ArquivoUltCodFun)
	
	# --------- ESTADOS --------------
	ArquivoEstado = "..\\awk\\GEESTADO.txt"
	while((getline < ArquivoEstado) > 0){
		uf_estado = $4
		codi_estado = $1
		
		CodiEstado[uf_estado] = codi_estado
	} close(ArquivoEstado)
	
	# --------- SERVICOS --------------
	ArquivoServico = "..\\temp\\foservicos03.csv"
	while((getline < ArquivoServico) > 0){
		codi_emp_servico = $1
		codi_servico = $2
		
		# Cria o vetor que vai receber o codigo do servico
		CodiServico[codi_emp_servico "-" codi_servico] = codi_servico
	} close(ArquivoServico)

}

# FUNCOES PARA RETORNAR OS VALORES

# CODIGO DO DEPARTAMENTO
function RetornaCodiDepto(argEmpDepto, argCodiDepto){
	CodigoDepto = ""
	
	IndiceDepto = argEmpDepto "-" argCodiDepto
	
	if(CodiDepto[IndiceDepto] != "")
		CodigoDepto = CodiDepto[IndiceDepto]
	else
		CodigoDepto = 999 # CÓDIGO GERAL DO DEPTO
	
	return CodigoDepto
}

# CODIGO DO CARGO
function RetornaCodiCargo(argEmpCargo, argCodiCargo){
	CodigoCargo = ""
	
	IndiceCargo = argEmpCargo "-" argCodiCargo
	
	if( CodiCargo[IndiceCargo] != "" )
		CodigoCargo = CodiCargo[IndiceCargo]
	else
		CodigoCargo = 999 # CÓDIGO GERAL DO CARGO
	
	return CodigoCargo
}

# CODIGO DO SINDICATO
function RetornaCodiSindicato(argCodiSindicato){
	CodigoSindicato = ""
	
	IndiceSindicato = argCodiSindicato
	
	if(CodiSindicato[IndiceSindicato] != "")
		CodigoSindicato = CodiSindicato[IndiceSindicato]
	else
		CodigoSindicato = 1 # CÓDIGO GERAL DO SINDICATO
	
	return CodigoSindicato
}

# CODIGO DO JORNADA
function RetornaCodiJornada(argEmpJornada, argCodiJornada){
	CodigoJornada = ""
	
	IndiceJornada = argEmpJornada "-" argCodiJornada
	
	if(CodiJornada[IndiceJornada] != "")
		CodigoJornada = CodiJornada[IndiceJornada]
	else
		CodigoJornada = 999 # CÓDIGO GERAL DA JORNADA
	
	return CodigoJornada
}

# CENTRO DE CUSTOS
function RetornaCodiCCusto(argEmpCCusto, argCodiCCusto){
	CodigoCCusto = ""
	
	IndiceCCusto = argEmpCCusto "-" argCodiCCusto
	
	if(CodiCCusto[IndiceCCusto] != "")
		CodigoCCusto = CodiCCusto[IndiceCCusto]
	else
		CodigoCCusto = 999 # CÓDIGO GERAL DA JORNADA
	
	return CodigoCCusto
}

# ULTIMO CODIGO DOS FUNCIONARIOS
function RetornaUltimoCodFunc(argCodiEmpUltCodFun){
	
	UltimoCodigoFunc = ""
	
	IndiceUltCodFun = argCodiEmpUltCodFun
	
	if( UltCodFun[IndiceUltCodFun] != "" ){
		UltimoCodigoFunc = UltCodFun[IndiceUltCodFun]
	
		return UltimoCodigoFunc
	}
	else
		return "" # NAO RETORNA NADA
}

# CODIGO DO ESTADO
function RetornaCodiEstado(argUFEstado){
	CodigoEstado = "NULO"
	
	IndiceEstado = argUFEstado
	
	if(CodiEstado[IndiceEstado] != "")
		CodigoEstado = CodiEstado[IndiceEstado]
	else
		CodigoEstado = "NULO"
	
	return CodigoEstado
}

# CODIGO DO SERVICO
function RetornaCodiServico(argEmpServico, argCodiServico){
	CodigoServico = ""
	
	IndiceServico = argEmpServico "-" argCodiServico
	
	if(CodiServico[IndiceServico] != "")
		CodigoServico = CodiServico[IndiceServico]
	else
		CodigoServico = 1 # CODIGO GERAL DO SERVICO
	
	return CodigoServico
}