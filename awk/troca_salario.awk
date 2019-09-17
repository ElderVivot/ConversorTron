BEGIN { 
	FS = ";"; 
	OFS = FS;
	sem_uso = "NULO";
	
	i_codigo = 3 # O TERCEIRO JAH ESTA CADASTRADO
	
	# DADOS FOTABELAS
	i_tabelas = 5
	aux1 = sem_uso
	aux2 = sem_uso
	origem_reg = 1
	
	# DADOS QUE SERAO FIXOS E NAO BUSCADOS DA TRON
	retroativo_data = sem_uso
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}	
 
	codi_emp = Campo("CODEMPFOL")
	codi_emp = soNumeros(codi_emp)
	
	i_empregados = Campo("MATEPGCTT")
	i_empregados = soNumeros(i_empregados)
	i_empregados = RetornaInformacaoFun(codi_emp, i_empregados)
	
	competencia = Campo("DTAREACTTPARSAL")
	competencia = Trim(competencia)
	competencia = FormatDate(competencia, "-", "US")
	competencia = isDate(competencia)
	
	admissao = RetornaDataAdmissao(codi_emp, i_empregados)
	
	# DADOS PARA TABELA FOTABELAS --> VAI SER OS MOTIVOS
	nome = Campo("MOTIVO")
	nome = Trim(nome)
	nome = upperCase(nome)
	nome = isNull(nome)
	
	if( JaImprimiuMotivo[nome] == 0 && nome != "NULO" ){
		i_codigo++
		i_codigo_vetor[nome] = i_codigo
		
		print i_tabelas, i_codigo, nome, aux1, aux2, origem_reg > "..\\prontos\\3_fotabelas.csv"
		
		JaImprimiuMotivo[nome] = 1
	}
	
	motivo = IfElse( nome == "NULO" , "", i_codigo_vetor[nome] )
	
	i = codi_emp "-" i_empregados
	
	if( i != i_ant && competencia != admissao )
		competencia = admissao
	else
		competencia = competencia
	
	novo_salario = Campo("REFPARSAL")
	novo_salario = Trim(novo_salario)
	novo_salario = FormataCampo("double", novo_salario, 30, 6)
	
	if( i_empregados != "" && int(novo_salario) > 0 )
		print codi_emp, i_empregados, competencia, novo_salario, motivo, retroativo_data
	else
		print codi_emp, i_empregados, competencia, novo_salario, motivo, retroativo_data > "..\\temp\\troca_salario_invalido.csv"
		
	i_ant = i
}
