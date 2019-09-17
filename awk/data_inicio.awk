BEGIN {
	# FUNÇÃO ANOMESDIA --> PRIMEIRO VAI TRANSFORMAR PARA ESTE FORMATO AFIM DE IDENTIFICAR A MAIOR E MENOR DATA
	# FUNÇÃO DIAMESANO --> VAI TRANSFORMAR PRO FORMATO PADRÃO NOVAMENTE PARA DEPOIS SER IMPORTADO
	# ESTE ARQUIVO EH QUE IRA GERAR OS ARQUIVOS 02 DE FOSERVICOS, FOVIGENCIAS_SERVICOS, FOHORARIOS, FOJORNADAS, CARGOS, DEPARTAMENTOS
	# ESTE ARQUIVO EH QUE IRA GERAR OS ARQUIVOS 04 DE EMPRESAS
	
	FS = ";"; OFS = FS;
	
	# ARMAZENA A DATA DE INICIO DAS ATIVIDADES DA EMPRESA
	file = "..\\temp\\empresas03.csv"
	while((getline < file) > 0) {
		codi_emp = $1
		dtinicio_emp = $77
		relDtIni[codi_emp] = dtinicio_emp
	}close(file)
	
	# IMPRIME O CÓDIGO DA EMPRESA, DATA DE ADMISSÃO DOS EMPREGADOS PREPARADO PARA SER ORGANIZADO PELA MENOR DATA
	file = "..\\temp\\empregados03.csv"
	while((getline < file) > 0) {
		codi_emp = $1
		admissao = AnoMesDia($12)
		print codi_emp, admissao > "..\\temp\\dt_admissao_emp.csv"	
	}close(file)
	close("..\\temp\\dt_admissao_emp.csv")
	
	# IMPRIME O CÓDIGO DA EMPRESA, DATA DE ADMISSÃO DOS CONTRIBUINTES PREPARADO PARA SER ORGANIZADO PELA MENOR DATA
	file = "..\\temp\\contribuintes.csv"
	while((getline < file) > 0) {
		codi_emp = $1
		admissao = AnoMesDia($12)
		print codi_emp, admissao >> "..\\temp\\dt_admissao_emp.csv"	
	}close(file)
	close("..\\temp\\dt_admissao_emp.csv")
		
	# ARMAZENA A DATA DE ADMISSAO DO EMPREGADO MAIS ANTIGO PARA OS CARGOS E DEPARTAMENTOS
	system("if exist ..\\temp\\dt_admissao_emp.csv sort ..\\temp\\dt_admissao_emp.csv > ..\\temp\\dt_admissao_emp2.csv")
	file = "..\\temp\\dt_admissao_emp2.csv"
	while((getline < file) > 0) {
		codi_emp = int($1)
		admissao = $2
		if (dtAntiga[codi_emp] != 1) {
			relDtEmpAnt[codi_emp] = DiaMesAno(admissao)
			dtAntiga[codi_emp] = 1
		}
	}close(file)
	
	file = "..\\temp\\empresas03.csv"
	while((getline < file) > 0) {
		codi_emp = int($1)
		dt_inicio = $77
		dt_inicio = MenorData(relDtIni[codi_emp],relDtEmpAnt[codi_emp])
		if (dt_inicio != "NULO") 
			dt_inicio = DiaMesAno(dt_inicio)
		if ((dt_inicio == "//") || (dt_inicio == "") || (dt_inicio == "NULO")) 
			dt_inicio = DiaMesAno(relDtEmpAnt[codi_emp])
		if ((dt_inicio == "//") || (dt_inicio == "") || (dt_inicio == "NULO")) 
			dt_inicio = today()
		$77 = dt_inicio
		relDtIni[codi_emp] = dt_inicio
		
		print  $0 > "..\\temp\\empresas04.csv"
	}close(file)
	
	file = "..\\temp\\cargos.csv"
	while((getline < file) > 0) {
		codi_emp = $1
		
		dt_inicio = MenorData(relDtIni[codi_emp], relDtEmpAnt[codi_emp])
		dt_inicio = DiaMesAno(dt_inicio)
		if ((dt_inicio == "//")  || (dt_inicio == "")  || (dt_inicio == "NULO")) 
			dt_inicio = today();
		$15 = dt_inicio
		print  $0 > "..\\temp\\cargos02.csv"
	}close(file)
	
	file = "..\\temp\\deptos.csv"
	while((getline < file) > 0) {
		codi_emp = $1
		
		dt_inicio = MenorData(relDtIni[codi_emp],relDtEmpAnt[codi_emp])
		dt_inicio = DiaMesAno(dt_inicio)
		if ((dt_inicio == "//")  || (dt_inicio == "")  || (dt_inicio == "NULO")) 
			dt_inicio = today();
		$11 = dt_inicio
		print  $0 > "..\\temp\\deptos02.csv"
	}close(file)

	file = "..\\temp\\foservicos03.csv"
	while((getline < file) > 0) {
		codi_emp = int($1)
		
		dt_inicio = MenorData(relDtIni[codi_emp], relDtEmpAnt[codi_emp])
		dt_inicio = DiaMesAno(dt_inicio)
		if ((dt_inicio == "")  || (dt_inicio == "NULO")) 
			dt_inicio = today();
		
		$32 = dt_inicio	
		print  $0 > "..\\temp\\foservicos04.csv"
	}close(file)
	
	file = "..\\temp\\fovigencias_servico03.csv"
	while((getline < file) > 0) {
		codi_emp = int($1)
		
		dt_inicio = MenorData(relDtIni[codi_emp], relDtEmpAnt[codi_emp])
		dt_inicio = DiaMesAno(dt_inicio)
		if ((dt_inicio == "")  || (dt_inicio == "NULO")) 
			dt_inicio = today();
		
		$3 = dt_inicio	
		print  $0 > "..\\temp\\fovigencias_servico04.csv"
	}close(file)

	file = "..\\temp\\fohorarios.csv"
	while((getline < file) > 0) {
		codi_emp = int($1)
		
		dt_inicio = MenorData(relDtIni[codi_emp],relDtEmpAnt[codi_emp])
		dt_inicio = DiaMesAno(dt_inicio)
		if ((dt_inicio == "")  || (dt_inicio == "NULO")) 
			dt_inicio = today();
		
		$4 = dt_inicio	
		print  $0 > "..\\temp\\fohorarios02.csv"
	}close(file)
	
	file = "..\\temp\\fojornadas.csv"
	while((getline < file) > 0) {
		codi_emp = int($1)
		
		dt_inicio = MenorData(relDtIni[codi_emp],relDtEmpAnt[codi_emp])
		dt_inicio = DiaMesAno(dt_inicio)
		if ((dt_inicio == "")  || (dt_inicio == "NULO")) 
			dt_inicio = today();
		
		$4 = dt_inicio	
		print  $0 > "..\\temp\\fojornadas02.csv"
	}close(file)
	
}

function AnoMesDia(dat) {
	dia = substr(dat,1 ,2 )
	mes = substr(dat,4 ,2 )
	ano = substr(dat,7 ,4 )
		
	dat = ano mes dia
	
	return dat
}

function MenorData(dat1,dat2) {
	dia1 = substr(dat1,1 ,2 );mes1 = substr(dat1,4 ,2 ); ano1 = substr(dat1,7 ,4 )		
	dat1 = ano1 mes1 dia1
	dia2 = substr(dat2,1 ,2 );mes2 = substr(dat2,4 ,2 ); ano2 = substr(dat2,7 ,4 )		
	dat2 = ano2 mes2 dia2
	
	if ((int(dat1) == 0) && (int(dat2) == 0)) 
		return "NULO";
	if ((int(dat1) == 0) || (dat1 == "")) 
		return dat2
	if ((int(dat2) == 0) || (dat2 == "")) 
		return dat1

	
	if (int(dat1) > int(dat2)) 
		return dat2
	else 
		return dat1
}

function DiaMesAno(dat) {
	dia = substr(dat,7 ,2 )
	mes = substr(dat,5 ,2 )
	ano = substr(dat,1 ,4 )
		
	dat = dia"/"mes"/"ano
	
	return dat
}
function today() {
	# VARIÁVEL CRIADA PARA ARMAZENAR RAPIDAMENTE A DATA ATUAL
	if (TODAY == "") TODAY = getCurrentDate()
	return TODAY
}
# FUNÇÃO QUE UTILIZA O MS-DOS PARA RECEBER A DATA DO WINDOWS
function getCurrentDate() {
	cmd = "date /t"
	cmd | getline tDate
	close(cmd)
	return trim(tDate)
}
function trim(str) {
	gsub(/^[ ]*|[ ]*$/,"", str)
	return str
}