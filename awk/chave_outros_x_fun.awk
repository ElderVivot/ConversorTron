BEGIN{
	FS = ";";
	
	# --------- FUNCIONARIOS ---------
	ArquivoFuncionarios = "..\\temp\\empregados03.csv"
	while((getline < ArquivoFuncionarios) > 0){
		
		codi_emp_fun = $1
		codi_funcionario = $2
		codi_sindicato = $56
		data_admissao = $12
		
		IndiceFun = codi_emp_fun "-" codi_funcionario
		
		# Cria o vetor que vai receber o código do cargo
		CodiFuncionario[IndiceFun] = codi_funcionario
		
		CodiSindFuncionario[IndiceFun] = codi_sindicato
		
		DataAdmissao[IndiceFun] = data_admissao
		
	} close(ArquivoFuncionarios)
	
}

# CODIGO DO FUNCIONARIOS COMPARANDO PELO CCDIGO DELE
function RetornaInformacaoFun(argCodiEmp, argI_Funcionario){
	CodigoFuncionario = ""
	
	IndiceFuncionario = argCodiEmp "-" argI_Funcionario
	
	if( CodiFuncionario[IndiceFuncionario] != "" ){
		CodigoFuncionario = CodiFuncionario[IndiceFuncionario]
	
		return CodigoFuncionario
	}
	else
		return ""
}

# CODIGO SINDICATO DO FUNCIONARIOS COMPARANDO PELO CCDIGO DELE
function RetornaCodigoSindicato(argCodiEmp, argI_Funcionario){
	CodigoSindicato = ""
	
	IndiceFuncionario = argCodiEmp "-" argI_Funcionario
	
	if( CodiSindFuncionario[IndiceFuncionario] != "" )
		CodigoSindicato = CodiSindFuncionario[IndiceFuncionario]
	else
		CodigoSindicato = 1
	
	return CodigoSindicato
}

# DATA ADMISSAO DO FUNCIONARIOS COMPARANDO PELO CCDIGO DELE
function RetornaDataAdmissao(argCodiEmp, argI_Funcionario){
	DataAdmissaoFun = ""
	
	IndiceFuncionario = argCodiEmp "-" argI_Funcionario
	
	if( DataAdmissao[IndiceFuncionario] != "" )
		DataAdmissaoFun = DataAdmissao[IndiceFuncionario]
	else
		DataAdmissaoFun = ""
	
	return DataAdmissaoFun
}

