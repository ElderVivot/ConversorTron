BEGIN { 
	FS = ";"; 
	OFS = FS; 
}
{
	if (FNR == 1) {
		for (c = 1; c <= NF; c++)
			Coluna[$c] = c
		next
	}
   
	codi_emp = Campo("CODEMPFOL")
    codi_emp = soNumeros(codi_emp)
	codi_emp = FormataCampo("integer", codi_emp, 15)
   
	i_depto = Campo("CODDEP")
    i_depto = soNumeros(i_depto)
	i_depto = FormataCampo("integer", i_depto, 15)
   
	nome = Campo("DSCDEP")
	nome = Trim(nome)
	nome = subsCharEspecial(nome)
	nome = upperCase(nome)
	
	# DADOS GERAIS QUE NÃO SERÃO BUSCADOS DA TRON
	sem_uso = "NULO"
	endereco = sem_uso
	numero = sem_uso
	bairro = sem_uso
	cidade = sem_uso
	estado = sem_uso
	cep = sem_uso
	origem_reg = 1
	data_inicio = sem_uso # DEPOIS VAI SER IMPLEMENTADO PARA BUSCAR DO ARQUIVO DATA_INICIO.AWK
	situacao = 1
	data_inativacao = sem_uso
	  
	print codi_emp, i_depto, nome, endereco, numero, bairro, cidade, estado, cep, origem_reg, data_inicio, situacao, data_inativacao
	
}
