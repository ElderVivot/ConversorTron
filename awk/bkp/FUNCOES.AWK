#
# Biblioteca de Fun‡äes
#
#

# Criada em: 18/01/2001
# Recebe   : Teste
# Retorna  : "Teste"
#
# Última alteração: 04/07/2005
# 					Função TestaCnpjCpf estava calculando o CNPJ incorretamente.
begin
	{
		# DECLARANDO CONSTANTES PARA USO EM FUNCOES
		TRUE = 1
		FALSE = 0
		CNPJCPF= ""
	OUT_FILENAME["GEEMPRE"] = "..\\prontos\\empresas.txt";
	OUT_FILENAME["FOEMPREGADOS"] = "..\\prontos\\empregados.txt";
	OUT_FILENAME["FOCARGOS"] = "..\\prontos\\cargos.txt";
	OUT_FILENAME["FODEPTO"] = "..\\prontos\\departamentos.txt";
	OUT_FILENAME["FOSERVICOS"] = "..\\prontos\\servicos.txt";
	OUT_FILENAME["FOHORAFOLHA"] = "..\\prontos\\horarios.txt";
	OUT_FILENAME["FOHORAFOLHASEM"] = "..\\prontos\\horarios_semana.txt";
	}
function dateToInt(idate) {
	if (isDate(idate) == 0) return 0
	return substr(idate,7,4) substr(idate,4,2) substr(idate,1,2)
}
function moveToTmp(mtmp_file) {
	mtmp_tmpfile = substr(mtmp_file,1,length(mtmp_file)-3) "tmp"
	mtmp_cmd = "if exist " mtmp_file " move /y " mtmp_file " " mtmp_tmpfile " > nul"
	close(mtmp_file);
	close(mtmp_tmpfile);
	system(mtmp_cmd)
	close(mtmp_cmd)
	close(mtmp_tmpfile)
	return mtmp_tmpfile
}
function deleteFile(df_file) {
	close(df_file)
	df_cmd = "if exist " df_file " del /q " df_file " > nul"
	system(df_cmd)
	close(df_cmd)
}
function today() {
	# VARIÁVEL CRIADA PARA ARMAZENAR RAPIDAMENTE A DATA ATUAL
	if (TODAY == "") TODAY = getDate()
	return TODAY
}
function FormataCampo(FcCampo) {
	gsub(/[ ]*$|^[ ]*/, "", FcCampo)
	if ((FcCampo == "<null>") || (FcCampo == ""))
		FcCampo = "NULO"
	return FcCampo
}

function selecionaColunas() {
	tamLinha = length($0)
	for (c=1; c<=tamLinha; c++) {
		char = substr($0,c,1)
		if (char != "") {
			if (char == " ")
				fimStr = 1
			if (fimStr == 1) {
				if (char == " ") numEspacos++
				else {
					numEspacos = 0; fimStr = 0; ini = 0;
					tc++
					FimColuna[tc] = c
					if (int(IniColuna[tc-1]) == 0) IniColuna[tc] = FimColuna[tc-1] + 1
					else IniColuna[tc] = FimColuna[tc-1]
					SelColuna[tc] = FimColuna[tc] - IniColuna[tc]
					ColunaNom = toupper(substr($0, IniColuna[tc], SelColuna[tc]))
					gsub(/[ ]*$|^[ ]*/,"",ColunaNom)
					ColunaIni[ColunaNom] = IniColuna[tc]
					ColunaSel[ColunaNom] = SelColuna[tc]
				}
			}
		}
		if (c == tamLinha) {
			tc++
			FimColuna[tc] = c + 1
			IniColuna[tc] = FimColuna[tc-1]
			SelColuna[tc] = FimColuna[tc] - IniColuna[tc]
			ColunaNom = toupper(substr($0, IniColuna[tc], SelColuna[tc]))
			gsub(/[ ]*$|^[ ]*/,"",ColunaNom)
			ColunaIni[ColunaNom] = IniColuna[tc]
			ColunaSel[ColunaNom] = SelColuna[tc]
		}
	}
}
function retornaColuna(icoluna) {
	rcoluna = substr($0, ColunaIni[icoluna], ColunaSel[icoluna])
	gsub(/[ ]*$|^[ ]*/,"",rcoluna)
	if (rcoluna == "<null>") rcoluna = ""
	return upperCase(rcoluna)
}

function upperCase(upCampo) {
	# AUMENTA A CAIXA DOS CARACTERES NORMAIS USANDO tolower()
	upCampo = toupper(upCampo);
	
	# AUMENTA A CAIXA DOS CARACTERES ACENTUADOS
	gsub("á", "Á", upCampo); gsub("é", "É", upCampo); gsub("í", "Í", upCampo); gsub("ó", "Ó", upCampo); gsub("ú", "Ú", upCampo);
	gsub("â", "Â", upCampo); gsub("ê", "Ê", upCampo); gsub("ô", "Ô", upCampo);
	gsub("ã", "Ã", upCampo); gsub("õ", "Õ", upCampo);
	gsub("ü", "Ü", upCampo);
	gsub("à", "À", upCampo);
	gsub("ç", "Ç", upCampo);
	
	return upCampo
}
	
# TIRA ESPAÇOS ANTES E NO FINAL DO TEXTO
function Trim(trimCampo){
	gsub(/[ ]*$|^[ ]*/,"",trimCampo)
	
	if(trimCampo == "<null>")
		trimCampo = ""
	else trimCampo = trimCampo
	
	return trimCampo
}

# SÓ NÚMEROS
function soNumeros(soNumero){
	gsub(/[^0-9]/, "", soNumero)
	
	return soNumero
}

	
# Criada em: (indeterminado)
# Recebe   : asTexto que corresponde a uma string a ser manipulada
# Retorna  : asTexto com aspas duplas anteriores e posteriores ao texto original.
# Definicao: Gera uma string apartir de asTexto com aspas duplas em suas extremidades
function Aspas(asTexto)
{
        return "\"" asTexto "\""
}

####################################################
# Criada em: 19/01/2001
# Recebe   : String com a data a ser manipulada
# Retorna  : String com a data ajustada
# Definição: E usada para ajustar datas ao formato esperado por sistemas
#            de importação de dados. Recebe data em formato
#            Brasileio(DD-MM-AAAA) e retorna em formato Japones(AAAA-MM-DDD).
####################################################
function FormatDate( asBrDate )
{
   if ( length(asBrDate) == 10 ) {
      return substr(asBrDate,7,4) "-" \
             substr(asBrDate,4,2) "-" \
             substr(asBrDate,1,2)
   } else {
      return ""
   }
}

# Criade em: 19/01/2001
# Recebe   : String com valor numérico padrão Europeu(1.250,56)
# Retorna  : String com valor numérico padrão Americano(1250.56)
# Definição: Usada para ajusar campo numérico com definição de
#            vírgula como separador decimal e ponto para definição
#            de milhar.

function CnvNum( asBrVal )
{
   gsub( "[.]",  "", asBrVal )
   gsub( "[,]", ".", asBrVal )

   return asBrVal + 0
}

# Criada em: 05/03/2001
# Recebe   : esta e uma string teste \x0D\x0A com uma quebra de linha
# Retorna  : esta e uma string teste
#            com uma quebra de linha
# Descricao: Esta funcao substitui as representacoes abaixo pelos
#            seus respectivos codigos:
#            \x0D\x0A   por CR
#            \x09       por TAB
#
function SubCodHex( asSource )
{
   gsub( "\\\\x0D\\\\x0A", "\n", asSource )
   gsub( "\\\\x09"       , "\t", asSource )

   return asSource
}

# Criade em: 19/01/2001
# Recebe   : String com valor numérico padrão Europeu(1.250,56)
# Retorna  : String com valor numérico padrão Americano(1250.56)
# Definição: Usada para ajusar campo numérico com definição de
#            vírgula como separador decimal e ponto para definição
#            de milhar.

function Space(aiTamanho)
	{	lsReturn=""
		for (liIndice=1; liIndice<=aiTamanho; liIndice++)
			{
				lsReturn=lsReturn " "
			}
		return lsReturn
	}


# Criada em: 11/01/2002
# Recebe   : asCampo que corresponde a uma string a ser manipulada e asTodos que determina
#            se deve eliminar todos os espacos vazios da string.
# Retorna  : asCampo sem espacos vazios, anteriores e posteriores aos caracteres
# Definicao: Gera uma string apartir de asCampo sem espacos. O modo de eliminacao dos...
#            ... espacos vazios sera gerenciado por asTodos = Onde asTodos = "S" ...
#            ... significa que todos os espacos serao eliminaods e asTodos = "N" ...
#            ... significa que somente os espacos antes e depois do fim do texto serao...
#            ... eliminados.
function Trim(asCampo,asTodos)
	{	
		### gsub (/[ ]*$|^[ ]*/,"")  . . .
		### ... Espacos([ ]), todos(*), no fim($) do arquivo...
		### ... ou(|)...
		### ... espacos([ ]), todos(*), no comeco($) do arquivo
  	
		lsReturn=asCampo
		
		asTodos = IfElse(asTodos == "","N",asTodos)
		
		if (asTodos == "N")
			{
				gsub(/[ ]*$|^[ ]*/,"",lsReturn)
			}
		if (asTodos == "S")
			{
				gsub(/[ ]/,"",lsReturn)
			}
		return lsReturn
	}
	
# Criada em  ..: 16/02/2002
# Recebe     ..: String de caracteres com o nome de arquivo(nome + extensao)
# Retorna    ..: String de caracters com nome de arquivo com asNovaExtensao...
#            ... q se nao for informada, sera retornado somente o novo nome...
#            ... q por sua vez, caso nao exista asFileName, retornara cadeia nula...
#            ... de caracteres.            
function ExtraiNomeArquivo(asFileName,asNovaExtensao)
	{	
		lsNovoArquivo = ""
		for(liIndice=1;liIndice <= length(asFileName);liIndice++)
			{
				if (substr(asFileName,liIndice,1) == ".")
					{
						lsNovoArquivo = substr(asFileName,1,(liIndice-1)) asNovaExtensao
					}
			}
		return lsNovoArquivo
	}
	
	
# Criada em: 17/01/2002
# Recebe   : asFileName com String de caracteres referente ao nome do arqvuivo
# Retorna  : somente o Path do arquivo informado em asFileName
# Definicao: Tera a funcao especifica de extrair o Path do nome de arquivos...
#
function ExtraiPathArquivo(asFileName)
	{	
		lsPath = ""
		for(liIndice=1;liIndice <= length(asFileName);liIndice++)
			{
				if (substr(asFileName,liIndice,1) == "\\")
					{
						lsPath = substr(asFileName,1,liIndice)
					}
			}
			
		return lsPath
	}


# Criada em: 17/01/2002
# Recebe   : alCondicao é um argumento logico por ser esperada uma condicao
#            ...que sera testada. Caso ela seja verdadeira havera um retorno devido.
# Retorna  : Caso alCondicao seja verdadeiro, auRetornoIf e retornado.
#            Caso alCondicao seja falso, auRetornoElse sera retornado
# Definicao: Tera a funcao especifica de agiliar processo de igualamento de variaves em linha
#            ... ou de efetuar testes de diversas opcoes, tmbem em linha...
#
function IfElse(alCondicao,auRetornoIf,auRetornoElse)
	{
		if (alCondicao)
			{
				return auRetornoIf
			}
		else
			{
				return auRetornoElse
			}
	}
	

# Criada em: 18/01/2002
# Recebe   : anValor q é o valor a ser trabalhado, aiInteiros q é a quantidade d digitos
#            ...inteiros q devera ficar em anValor e aiDecimais q é a quantidade de digitos
#            ...de decimais(apos virgula ou ponto) q deve ficar em anValor
# Retorna  : Valor de anValor formatado com aiInteiros e aiDecimais, preenchido com
#            ...cadeia de zeros à esquerda.
# Definicao: Servira para retornar os campos numericos preenchidos com zeros à esquerda.
#
function StrZero(anValor,aiTamInteiros,aiTamDecimais)
	{

 		aiTamInteiros += 0
 		aiTamDecimais += 0
 		
		#// anValor = SoNumeros(anValor)
		
		liInteiros = ""
		liDecimais = ""
		
		liPos = ""
		liPos = match(anValor,"\\.")
		
		if (liPos != 0)
			{
				liInteiros = substr(anValor,1,liPos-1)
				liDecimais = substr(anValor,liPos,(length(anValor)-(length(anValor)-(liPos+1))))
			}
		else
			{
				liInteiros = anValor
			}
		
		if (length(liInteiros) > aiTamInteiros)
			{
				return 0
			}
		if (length(liDecimais) > aiTamDecimais)
			{
				return 0
			}

		gsub(/[^0-9]/,"",liInteiros)
		liInteiros = Space(aiTamInteiros-length(liInteiros)) liInteiros
		gsub(/[ ]/,"0",liInteiros)
		
		gsub(/[^0-9]/,"",liDecimais)
		liDecimais = liDecimais Space(aiTamDecimais-length(liDecimais))
		gsub(/[ ]/,"0",liDecimais)
		
		if (length(liInteiros) == 0)
			{
				return 0
			}
				
		if (length(liDecimais) > 0)
			{
				liDecimais = "." liDecimais
			}
		
		return liInteiros liDecimais
	}


# Criada em: 23/01/2002
# Recebe   : asValor q é uma string de caracteres a ser trabalhada
# Retorna  : string de caracteres
# Definicao: Servira para retornar asValor somente com caracteres numericos. Sinal de + - . e , serao eliminados
#            PODE SER USADO EM COMBINACAO COM STRZERO PARA GERAR UMA STRING DE VALOR NUMERICOS COM DECIMAIS COMO SE FOSSE INTEIROS E COM ZEROS A ESQUERDA(USADO EM LAYOUTS DE IMPORTACAO)
function SoNumeros(asValor)
	{
		lsValorRetorno = asValor
		gsub(/[^0-9]/,"",lsValorRetorno)
		return lsValorRetorno
	}
function eAnoBissexto(Year) {
	if ((Year % 400) == 0)
		return 1
	else if ((Year % 100) == 0)
		return 0
	else if ((Year % 4) == 0)
		return 1
	else
		return 0
}

# Criada em: 24/01/2002
# Recebe   : aiCnpj é um valor inteiro(ou string) a ser testado como CNPJ valido
# Retorna  : verdadeiro caso seja um CNPJ valido.. FALSO caso contrario
# Definicao: Servira para retornar a condicao do CNPJ(aiCnpj) informado como parametro.
#            PODE SER USADO EM COMBINACAO COM STRZERO PARA GERAR UMA STRING DE VALOR NUMERICOS COM ZEROS A ESQUERDA(USADO EM LAYOUTS DE IMPORTACAO)
function TestaCnpjCpf(aiCnpjCpf)
	{
		liDig1 = ""
		liDig2 = ""
		liResto = ""
		liDg1 = ""
		liDg2 = ""
		liCar = ""
		liIndice = ""
		liMultiplicador = "2"
		liSoma = "0"
		
		liCnpjCpf = SoNumeros(aiCnpjCpf)
	
		
		if (length(liCnpjCpf) < 11)
			{
				return FALSE
			}
			
			
		if (length(liCnpjCpf) < 14)
			{
				if (length(liCnpjCpf) > 11)
					{
						return FALSE
					}
			}
		
		
		if (length(liCnpjCpf) == 14)  # se = CNPJ
		
			{
			
				for(liIndice=12;liIndice >= 1;liIndice--)
					{
						liCar = substr(liCnpjCpf,liIndice,1)
						liSoma += (liCar * liMultiplicador)
						liMultiplicador++
						if (liMultiplicador > 9)
							{
								liMultiplicador = 2
							}
					}

				liResto = liSoma
				liResto %= 11

	
				if (liResto < 2)
					{
						liDig1 = 0
					}
				else
					{
						liDig1 = 11 - liResto
					}
		
				liSoma = (liDig1 * 2)
		
				liMultiplicador = 3
		
				for(liIndice=12;liIndice >= 1;liIndice--)
					{
						liCar = substr(liCnpjCpf,liIndice,1)
			
						liSoma += (liCar * liMultiplicador)
						
						liMultiplicador++
						if (liMultiplicador > 9)
							{
								liMultiplicador = 2
							}
					}
			
			
				liResto = liSoma
				

				liResto %= 11

		
				if (liResto < 2)
					{
						liDig2 = 0
					}
				else
					{
						liDig2 = (11-liResto)
					}
		
				liDg1 = substr(liCnpjCpf,13,1)
				liDg2 = substr(liCnpjCpf,14,1)
				
			}
		else
			{
				
				liSoma = "0"
				liMultiplicador = "2"
				for(liIndice = 9;liIndice >= 1;liIndice--)
					{
						liCar = substr(liCnpjCpf,liIndice,1)
						liSoma += (liCar * liMultiplicador)
						liMultiplicador++
					}
				
				liResto = liSoma
				liResto %= 11
				
				if (liResto < 2)
					{
						liDig1 = 0
					}
				else
					{
						liDig1 = (11 - liResto)
					}
					
				liSoma = (liDig1 * 2)
				liMultiplicador = 3
				
				for(liIndice = 9;liIndice >= 1;liIndice--)
					{
						liCar = substr(liCnpjCpf,liIndice,1)
						liSoma += (liCar * liMultiplicador)
						liMultiplicador++
					}
				
				liResto = liSoma
				liResto %= 11
				
				if (liResto < 2)
					{
						liDig2 = 0
					}
				else
					{
						liDig2 = (11 - liResto)
					}
					
				liDg1 = substr(liCnpjCpf,10,1)
				liDg2 = substr(liCnpjCpf,11,1)
				
			}
			
		if (liDig1 != liDg1)
			{
				return FALSE
			}
			
		if (liDig2 != liDg2)
			{
				return FALSE
			}
		
		CNPJCPF = liCnpjCpf
			
		return TRUE
		
	}
	
	
# Criada em: 28/01/2002
# Recebe   : aiNumero q corresponde a uma string ou valor inteiro... 
# Retorna  : verdadeiro ou falso
# Definicao: quando string é um numero(somente digitos de 0 a 9.. ) retorna verdadeiro.
function TestaNumero(aiNumero)
	{
		liValorTeste = aiNumero
		liQuanCaracter = gsub(/[^0-9]/,"",liValorTeste)

		if (liQuanCaracter != 0)
			{
				return FALSE
			}
		return TRUE
	}



# Criada em: 19/02/2002
# Recebe   : anValor é um valor com pontos e virgulas
# Retorna  : anValor com pontos e virgulas invertidos(onde era ponto fica virgula onde era virgula .. fica ponto)
# Definicao: servira para transformar valores com pontos e virgulas para o padrao inverso ao q esta em anValor

function InvertePontoVirgula(anValor)

	{
		lnValor = anValor
		gsub(/[.]/,"(",lnValor)
		gsub(/[,]/,".",lnValor)
		gsub(/[(]/,",",lnValor)
		print lnValor
	}


# Criada em: 05/03/2002
# Recebe   : aiAno e o ano a ser testado como bissexto
# Retorna  : condicao de ser ou nao ano bissexto
# Definicao: sera usado em funcoes de tratamento de ano(funcoes de coneversao em segundos/ano)
	
function AnoBissexto(aiAno)
{
    liRetorno = (aiAno % 4 == 0 && aiAno % 100 != 0) ||
            (aiAno % 400 == 0)
    return liRetorno
}

# Criada em: 05/02/2002
# Recebe   : recebe asData que pode estar formatada para...
#            ...asTipoData("BR"-"JP"-"US" BRASILEIRO/JAPONES/AMERICANO) e ...
#            ...aiQuantiaAnos q corresponde a quantos anos sera somado adiante.
# Retorna  : string com asData + aiQuantiaAnos(OBS - SEGUE PADRAO DE SOMAR 365 DIAS E NAO SO AUMENTAR O ANO)
# Definicao: sera usada na CONVERSAO PROSOFT para calculo da data de vencimento de ferias...
#            ...e data proximo exame medico.

function SomaAno(asData,aiQuantiaAnos,asTipoData)

	{
		lsRetorno =""
		lsMeses30 = "01-05-07-08-10-12"
		lsAchou = 0
		lsJaRetornar = "N"
		lsDia    = ""
		lsMes    = ""
		lsAno    = ""
		lsMesAnt = ""
		asTipoData = IfElse(asTipoData == "","BR",asTipoData)
		
		if (asData == "")
			{
				return asData
			}

		if (aiQuantiaAnos == "")
			{
				return aiQuantiaAnos
			}


		if (asTipoData == "BR") ## TIPO BRASILEIRO DD/MM/AAAA - QUATRO DIGITOS NO ANO
			{
				lsDia = substr(asData,1,2)
				lsMes = substr(asData,4,2)
				lsAno = substr(asData,7,4)
			}
			
		if (asTipoData == "JP")  ## TIPO JAPONES DE DATA - AAAA/MM/DD
			{
				lsAno = substr(asData,1,4)
				lsMes = substr(asData,6,2)
				lsDia = substr(asData,9,2)
			}

		if (asTipoData == "US")  ## TIPO AMERICANO DE DATA - MM/DD/AAAA
			{
				lsMes = substr(asData,1,2)
				lsDia = substr(asData,4,2)
				lsAno = substr(asData,7,4)
			}

		lsAnoRetorno = lsAno
		lsAnoRetorno += aiQuantiaAnos
		lsAnoRetorno = lsAnoRetorno ""
		lsAnoRetorno = StrZero(lsAnoRetorno,4)

		if ((lsDia == "01") && (lsMes == "01"))
			{
				lsRetorno = "31/12/" lsAnoRetorno
				lsJaRetornar = "S"
			}
			
		if ((lsMes == "03") && (lsDia == "01"))
			{
				lsRetorno = "28/02/" lsAnoRetorno
				lsJaRetornar = "S"
			}
			
		if ((lsMes == "02") && (lsDia == "29"))
			{
				lsRetorno = "28/02/" lsAnoRetorno
				lsJaRetornar = "S"
			}
		if ((lsMes == "04") && (lsDia == "01"))
			{
				lsRetorno = "31/03/" lsAnoRetorno
				lsJaRetornar = "S"
			}
		
		if (lsJaRetornar == "N")
			{
				lsMesAnt = (lsMes-1)
				lsMesAnt = lsMesAnt ""
				lsMesAnt = StrZero(lsMesAnt,2)
				liAchou = match(lsMeses30,lsMesAnt)
							
				if (lsDia == "01")
					{
						if (liAchou == 0) ## SE FOR MES ANTERIOR FOR DE 31 DIAS
							{
								lsRetorno = "30/" lsMesAnt "/" lsAnoRetorno
							}
						else
							{
								lsMes = lsMesAnt
								lsRetorno = "31/" lsMesAnt "/" lsAnoRetorno
							}
					}
				else
					{
						lsDia -= 1
						lsDia = lsDia ""
						lsDia = StrZero(lsDia,2)
						lsRetorno = lsDia "/" lsMes "/" lsAnoRetorno
					}
			}
	
		if (asTipoData == "JP")  ## TIPO JAPONES DE DATA - AAAA/MM/DD
			{
				lsRetorno = substr(lsRetorno,7,4) "/" substr(lsRetorno,4,2) "/" substr(lsRetorno,1,2)
			}

		if (asTipoData == "US")  ## TIPO AMERICANO DE DATA - MM/DD/AAAA
			{
				lsRetorno = substr(lsRetorno,4,2) "/" substr(lsRetorno,1,2) "/" substr(lsRetorno,7,4)
			}
		return lsRetorno
	}
function relativeDate(iDate, iDays) {
	# VERIFICA SE É UMA DATA VÁLIDA
	if (isDate(iDate) == 0) return iDate
	
	# RERTORNA A PROPRIA DATA CASO NÃO SEJA UM NÚMERO INTEIRO
	if (int(iDays) == 0) return iDate
	
	# QUEBRA A DATA PADRÃO DD/MM/YYYY EM DIA, MES E ANO
	split(iDate, aDate, "/")
	day = int(aDate[1])
	month = int(aDate[2])
	year = int(aDate[3])
	
	# APAGA O VETOR CASO EXISTA
	delete dMonth
	# CRIA UM VETOR COM A QUANTIDADE DE DIAS DE CADA UM DOS 12 MESES
	dMonth[1] = 31; dMonth[2] = 28; dMonth[3] = 31; dMonth[4] = 30;
	dMonth[5] = 31; dMonth[6] = 30; dMonth[7] = 31; dMonth[8] = 31;
	dMonth[9] = 30; dMonth[10] = 31; dMonth[11] = 30; dMonth[12] = 31;
	
	# SE O NÚMERO DE DIAS FOR POSITIVO
	if (iDays > 0) {
		yDays = 365
		while (iDays > 365) {
			year++
			if (eAnoBissexto(year) == 1) yDays = 366
			else yDays = 365
			iDays -= yDays
		}
		for (d=1; d<=iDays; d++) {
			# SE FOR UM ANO BISSEXTO
			if (eAnoBissexto(year) == 1) dMonth[2] = 29
			else dMonth[2] = 28
			if ((day == 31)&&(month == 12)) {
				day = 0
				month = 1
				year++
			}
			# SE O DIA FOR O ÚLTIMO DIA DO MÊS
			if (day == dMonth[month]) {
				month++
				day = 0
			}
			day++
		}
	} else {
	# SE O NÚMERO DE DIAS FOR NEGATIVO
		while (iDays < (-365)) {
			if (eAnoBissexto(year) == 1) yDays = 366
			else yDays = 365
			iDays += yDays
			year--
		}
		for (d=iDays; d<0; d++) {
			# SE FOR UM ANO BISSEXTO
			if (eAnoBissexto(year) == 1) dMonth[2] = 29
			else dMonth[2] = 28
			day--
			if (day == 0) {
				month--
				day = dMonth[month]
			}
			if ((day == 1)&&(month == 1)) {
				day = dMonth[12]
				month = 12
				year--
			}
		}
	}
	# RETORNA A DATA FINAL
	return sprintf("%.2d/%.2d/%s", day, month, year)
}

# Criada em: 28/05/2002
# Recebe   : recebe asDiaOrigem(dia a sofrer soma) e asQuantiaSomar(quantia de dias a somar)
#            ...asFormatoData("BR"-"JP"-"US" BRASILEIRO/JAPONES/AMERICANO) e ...
# Retorna  : Data no formato original e com a quantia de dias a somar na data original.
# Definicao: Serve para somar ou diminuir uma quantia x de dias em uma data y.
#            CASO asQuantiaSomar FOR PASSADO NEGATIVO(-5 POR EXEMPLO)
#            A FUNCAO RETORNARA A DATA DIMINUIDA DA QUANTIA DE DIAS NEGATIVOS.

function SomaDias(asDiaOrigem,asQuantiaSomar,asFormatoData)
	{
		### PARA DEIXAR PADRAO BR QDO ESTIVER VAZIO O FORMATO DA DATA INFORMADA.
		asFormatoData = IfElse(asFormatoData == "","BR",asFormatoData)
		
		### PARA DEIXAR PADRAO BR QDO ESTIVER COM VALOR INVALIDO.
		asFormatoData = IfElse(match("---BR---JP---US---",asFormatoData) == 0,"BR",asFormatoData)

		### SE O PADRAO FOR BRASILEIRO JA PEGA A DATA PRA TRABALHAR
		lsDiaOrigem = asDiaOrigem
		
		### SE NAO FOR BRASILEIRO O PADRAO, CONVERTE.
		if (asFormatoData == "JP")
			{

				lsSeparador =  substr(asDiaOrigem,5,1)

				if (lsSeparador == "\\")
					{
						lsSeparador = lsSeparador "\\"
					}

				if (asDiaOrigem == "")
					{
						return "    " lsSeparador "  " lsSeparador "  "
					}
			
				asQuantiaSomar += 0
	
				if (asQuantiaSomar == 0)
					{
						return "    " lsSeparador "  " lsSeparador "  "
					}
					
				lsDiaOrigem = substr(asDiaOrigem,9,2) lsSeparador substr(asDiaOrigem,6,2) lsSeparador substr(asDiaOrigem,1,4)
			}
		if (asFormatoData == "US")
			{
				lsSeparador = substr(asDiaOrigem,3,1)
				if (lsSeparador == "\\")
					{
						lsSeparador = lsSeparador "\\"
					}

				lsDiaOrigem = substr(asDiaOrigem,4,2) lsSeparador substr(asDiaOrigem,1,2) lsSeparador substr(asDiaOrigem,7,4)
			}
		if (asFormatoData == "BR")
			{
				lsSeparador = substr(asDiaOrigem,3,1)
				if (lsSeparador == "\\")
					{
						lsSeparador = lsSeparador "\\"
					}

			}
				

		if (asDiaOrigem == "")
			{
				return "  " lsSeparador "  " lsSeparador "    "
			}
			
		asQuantiaSomar += 0
		
		if (asQuantiaSomar == 0)
			{
				return "  " lsSeparador "  " lsSeparador "    "
			}
				
		lsDia = substr(lsDiaOrigem,1,2)
		lsMes = substr(lsDiaOrigem,4,2)
		lsAno = substr(lsDiaOrigem,7,4)
		
		lsDia += 0
		lsMes += 0
		lsAno += 0

		if (asQuantiaSomar > 0 )
			{
				for(liNum=1;liNum <= asQuantiaSomar;liNum++)
					{
						if (lsDia <= 27)
							{
								lsDia += 1
								continue
							}

						if (lsMes == 12)
							{
								if (lsDia == 31)
									{
										lsDia = 1
										lsMes = 1
										lsAno += 1
										continue
									}
								else
									{
										lsDia += 1
										continue
									}
							}
						
						if (lsMes == 2)
							{
								lsBisexto = lsAno
								lsBisexto %= 4
								### SE O ANO E BISEXTO E SABENDO Q SO CHEGOU...
								### AQUI PQ DIA E = 28 ENTAO E JA VAI SER NOVO MES.
								if (lsBisexto != 0)
									{
										lsMes += 1
										lsDia = 1
										continue
									}

								## SE TIVER 29 DIAS E PQ REALMENTE E ANO BISEXTO
								if (lsDia == 29)
									{
										lsDia = 1
										lsMes += 1
										continue
									}

								### SE NAO ERA BISEXTO E ERA DIA 28... AINDA NAO E FIM DO MES.. TEM Q SOMAR MAIS UM DIA E DESCER O SARRAFO
								lsDia += 1
								continue
							}
				
						lsMesAtua = lsMes
						lsMesAtua = lsMesAtua ""
						lsMesAtua = StrZero(lsMesAtua,2)

						if (match("--01--03--05--07--08--10--",lsMesAtua) != 0)
							{
								if (lsDia < 31)
									{
										lsDia++
										continue
									}
								else
									{
										lsDia = 1
										lsMes += 1
										continue
									}
							}

						
						if (match("--04--06--09--11--",lsMesAtua) != 0)
							{
								if (lsDia < 30)
									{
										lsDia += 1
										continue
									}
								else
									{
										lsDia = 1
										lsMes += 1
									}

							}
					}
			}
		else
			{
				liNum = -1
				while (liNum >= asQuantiaSomar)
					{
					
						lsMesAtua = lsMes
						lsMesAtua = lsMesAtua ""
						lsMesAtua = StrZero(lsMesAtua,2)

						if (lsDia > 1)
							{
								lsDia -= 1
								liNum -= 1
								continue
							}

						if (lsDia == 1)
							{
								if (match("01--02--04--06--08--09--11--",lsMesAtua) != 0)
									{
										if (lsMesAtua == "01")
											{
												lsDia = 31
												lsMes = 12
												lsAno -= 1
												liNum -= 1
												continue
											}
											
										lsDia = 31
										lsMes -= 1
										liNum -= 1
										continue
									}
					
								if (match("--05--07--10--12--",lsMesAtua) != 0)
									{
										lsDia = 30
										lsMes -= 1
										liNum -= 1
										continue
									}
									
								if (lsMes == 3)
									{
										lsBisexto = lsAno
										lsBisexto %= 4
										### SE O ANO E BISEXTO E SABENDO Q SO CHEGOU AQUI PQ DIA E MAIOR Q 27 ENTAO E DIA 28 E JA VAI SER NOVO MES
										if (lsBisexto != 0)
											{
												lsMes -= 1
												lsDia = 28
												liNum -= 1
												continue
											}
										else
											{ ### SE ANO BISSEXTO
												lsMes -= 1
												lsDia = 29
												liNum -= 1
												continue
											}
									}
							}

					}
			}

		### NOVA DATA EM FORMATO JAPONES - AAAA/MM/DD ###
		if (asFormatoData == "JP")
			{
				return StrZero(lsAno,4) lsSeparador StrZero(lsMes,2) lsSeparador StrZero(lsDia,2)
			}
			
		### NOVA DATA EM FORMATO AMERICANO - MM/DD/AAAA
		if (asFormatoData == "US")
			{
				return StrZero(lsMes,2) lsSeparador StrZero(lsDia,2) lsSeparador StrZero(lsAno,4)
			}
				
		return StrZero(lsDia,2) lsSeparador StrZero(lsMes,2) lsSeparador StrZero(lsAno,4)
	}


# Criada em: 14/08/2002
# Recebe   : Recebe asData, que pode ser uma variavel data com tipo(asTipoData) que
#            pode ser igual a JP(Japão),US(Estados Unidos) ou BR(Brasil).
# Retorna  : Retorna se a data é valida analisando limites para dia,mes,ano.
# Definicao: Determina se um campo é valido quando existir duvida sobre isso
function TestaData(asData,asTipoData)
	{
		if (asData == "")
			{
				return 0
			}

		asTipoData = IfElse((asTipoData == ""),"BR",asTipoData)
		
		lsDia = substr(asData,1,2)
		lsMes = substr(asData,4,2)
		lsAno = substr(asData,7,4)

		if (asTipoData == "JP")
			{
				lsDia = substr(asData,9,2)
				lsMes = substr(asData,6,2)
				lsAno = substr(asData,1,4)
			}

		if (asTipoData == "US")
			{
				lsDia = substr(asData,4,2)
				lsMes = substr(asData,1,2)
				lsAno = substr(asData,7,4)
			}


		if (!(TestaNumero(lsDia)))
			{
				return 0
			}

		if (!(TestaNumero(lsMes)))
			{
				return 0
			}

		if (!(TestaNumero(lsAno)))
			{
				return 0
			}

		lsDia += 0
		lsMes += 0
		lsAno += 0

		if (lsMes < 1)
			{
				return 0
			}

		if (lsMes > 12)
			{
				return 0
			}

		if (lsAno < 1)
			{
				return 0
			}

		if (lsDia < 1)
			{
				return 0
			}

		## SE DIA MAIOR QUE 0 E MENOR QUE 29 JA RETORNA OK POIS SE CHEGOU
		## ATE AQUI É POR QUE REALMENTE PASSOU NA VALIDACAO DE MES E ANO
		if ((lsDia > 0 ) && (lsDia < 29))
			{
				return 1
			}

		## SE O MES = 2 TEM-SE QUE ANALISAR SE O ANO É BISSEXTO POIS
		##  SE FOR O LIMITE E 29 DIAS, SE NAO FOR O LIMITE = 28
		if (lsMes == 2)
			{
				lsBisexto = lsAno
				lsBisexto %= 4
				### SE O ANO E BISEXTO E SABENDO Q SO CHEGOU...
				### AQUI PQ DIA E = 28 ENTAO E JA VAI SER NOVO MES.
				if (lsBisexto != 0)
					{
						if (lsDia > 28)
							{
								return 0
							}
					}
				else
					{
						if (lsDia > 29)
							{
								return 0
							}
					}
			}
		else
			{
				lsMesAtua = lsMes ""		
				if (match("--01--03--05--07--08--10--",lsMesAtua) != 0)
					{
						if (lsDia > 31)
							{
								return 0
							}
					}

						
				if (match("--04--06--09--11--",lsMesAtua) != 0)
					{
						if (lsDia > 30)
							{
								return 0
							}
					}
			}
		return 1
	}

# Criada em: 15/08/2002
# Recebe   : Nao recebe parametros
# Retorna  : String com caracter de tabulacao para separacao de colunas
# Definicao: Usado para impressao de arquivos AWK. Normalmente se
#            iguala OFS e FS a chamda desta funcao eliminando problema
#            de impressao do caractere TAB em um texto que precisara
#            interpretar a sua significacao como codigo programado AWK.
function RetornaTabSeparador()
	{
		return "\t"
	}

#
#
#
#
#Ajusta data no formato 011093 para 01/10/1993

function Data(asDoc, asTipo) {
	gsub(/[ ]*$|^[ ]*/,"", asDoc)
	gsub("[ .-]", "/", asDoc)
	
	if (substr(asDoc, 1 , 1) == "/") {
		asDoc = ""
	} else {	
		if (asTipo == "BR") {
			dia     = substr(asDoc, 1, match(asDoc, "/") - 1)
			barra2  = substr(asDoc, length(dia) + 2, length(asDoc))
			mes     = substr(barra2, 1, match(barra2, "/") - 1)
			tam     = match(barra2, "/") + 1
			ano     = substr(barra2, tam, length(barra2) - (length(mes) + 1))
		} else {
			if (asTipo == "JP") {
				ano     = substr(asDoc, 1, match(asDoc, "/") - 1)
				barra2  = substr(asDoc, length(ano) + 2, length(asDoc))
				mes     = substr(barra2, 1, match(barra2, "/") - 1)
				tam	    = match(barra2, "/") + 1
				dia     = substr(barra2, tam, length(barra2) - (length(mes) + 1))
			} else {		
				if (asTipo == "US") {	
					mes     = substr(asDoc, 1, match(asDoc, "/") - 1)
					barra2  = substr(asDoc, length(mes) + 2, length(asDoc))
					dia     = substr(barra2, 1, match(barra2, "/") - 1)
					tam     = match(barra2, "/") + 1
					ano     = substr(barra2, tam, length(barra2) - (length(dia) + 1))	
				}
			}
		}
		
		if (length(dia) < 2) {
			 dia = "0" dia
		}
		
		if (length(mes) < 2) {
			mes = "0" mes
		}
		
		ano += 0
		
		if (length(ano) < 3) {
			if (ano < 10) {
				ano = "200" ano							
			} else {
				ano = "19" ano				
			}
		} else {
			if (length(ano) == 3) {
				ano = "1" ano
			}	
		}
		
		asDoc = dia"/"mes"/"ano		
	}			
	
	if (asDoc != "0/0/2000") {
		return asDoc
	} else {
		return ""
	}
}function isDate(inDate) {
	iDay = 0; iMonth = 0; iYear = 0;
	if (inDate != "") {
		split(inDate, qDate, "/")
		iDay = int(qDate[1])
		iMonth = int(qDate[2])
		iYear = int(qDate[3])
		if ((iDay == 0)||(iDay > 31)) return 0
		if ((iMonth == 0)||(iMonth > 12)) return 0
		if (iYear == 0) return 0
		#Meses até 30 -> 04, 06, 09, 11		
		if ((iMonth == 4)||(iMonth == 6)||(iMonth == 9)||(iMonth == 11))
			if (iDay > 30) return 0
		if (iMonth == 2)
			if (iDay > 29) return 0
		#Se chegou até aqui a data é válida
		return 1
	} else return 0
}