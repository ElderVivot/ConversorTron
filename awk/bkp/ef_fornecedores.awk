BEGIN { FS = ""; OFS = "\t"}
{
	#Ignora o cabeçalho do arquivo
	if ((substr($0,1,6) == "CODEMP")||(substr($0,1,6) == "======")) next
	gsub("[\t]"," ", $0)
	codi_emp = substr($0,1,10)
	codi_for = substr($0,11,13)
	nome_for = substr($0,24,85)
	tins_for = substr($0,109,13)
	cgce_for = substr($0,122,23)
	CADASTRO_FOR = substr($0,145,16)
	imun_for = substr($0,194,23)
	insc_for = substr($0,217,23)
	ende_for = substr($0,245,85)
	nume_for = substr($0,335,15)
	bair_for = substr($0,350,85)
	cepe_for = substr($0,435,13)
	cida_for = substr($0,448,45)
	sigl_est = substr($0,493,14)
	formatar()
	if (CADASTRO_FOR == "") CADASTRO_FOR = "Data atual"
	gsub("[^0-9]","",cgce_for)
	gsub("[^0-9]","",cepe_for)
	gsub("[^0-9]","",nume_for)
	if (length(cepe_for ) < 8) cepe_for = ""
	nomr_for = GeraApelido(nome_for, 10)
	if (tins_for == 1) tins_for = 1
	else if (tins_for == 3) tins_for = 2
	else tins_for = 3
	print codi_emp, codi_for, nomr_for, tins_for, cgce_for, nome_for, ende_for, nume_for, bair_for, cepe_for, cida_for, sigl_est, insc_for, 
	imun_for, CADASTRO_FOR > "..\\temp\\fornecedores.txt"
}
function formatar()
{
	gsub(/[ ]*$|^[ ]*/,"",codi_emp)
	if (codi_emp == "<null>") codi_emp = ""
	gsub(/[ ]*$|^[ ]*/,"",codi_for)
	if (codi_for == "<null>") codi_for = ""
	gsub(/[ ]*$|^[ ]*/,"",nome_for)
	if (nome_for == "<null>") nome_for = ""
	gsub(/[ ]*$|^[ ]*/,"",tins_for)
	if (tins_for == "<null>") tins_for = ""
	gsub(/[ ]*$|^[ ]*/,"",cgce_for)
	if (cgce_for == "<null>") cgce_for = ""
	gsub(/[ ]*$|^[ ]*/,"",CADASTRO_FOR)
	if (CADASTRO_FOR == "<null>") CADASTRO_FOR = ""
	gsub(/[ ]*$|^[ ]*/,"",imun_for)
	if (imun_for == "<null>") imun_for = ""
	gsub(/[ ]*$|^[ ]*/,"",insc_for)
	if (insc_for == "<null>") insc_for = ""
	gsub(/[ ]*$|^[ ]*/,"",ende_for)
	if (ende_for == "<null>") ende_for = ""
	gsub(/[ ]*$|^[ ]*/,"",nume_for)
	if (nume_for == "<null>") nume_for = ""
	gsub(/[ ]*$|^[ ]*/,"",bair_for)
	if (bair_for == "<null>") bair_for = ""
	gsub(/[ ]*$|^[ ]*/,"",cepe_for)
	if (cepe_for == "<null>") cepe_for = ""
	gsub(/[ ]*$|^[ ]*/,"",cida_for)
	if (cida_for == "<null>") cida_for = ""
	gsub(/[ ]*$|^[ ]*/,"",sigl_est)
	if (sigl_est == "<null>") sigl_est = ""
}
function GeraApelido(GaEntrada, GaTamanho)
{
	GaApelido = ""
	if (GaEntrada == "")
		return ""
	else if (length(GaEntrada) <= GaTamanho)
		return GaEntrada
	else
	{
		GaCaracterAntes = substr(GaEntrada, GaTamanho, 1)
		GaCaracterDepois = substr(GaEntrada, GaTamanho + 1, 1)
		if ((GaCaracterAntes != " ")&&(GaCaracterDepois != " "))
		{
			for (Ga1=GaTamanho; Ga1>=0; Ga1--)
			{
				Ga1Caracter = substr(GaEntrada, Ga1, 1)
				if (Ga1Caracter == " ")
				{
					GaApelido = substr(GaEntrada, 1, Ga1)
					break
				}
			}
		}
		else
			GaApelido = substr(GaEntrada, 1, GaTamanho)
		
		gsub(/[ ]*$|^[ ]*/, "", GaApelido)
		Ga1Temp1 = substr(GaApelido, length(GaApelido) - 2, 3)
		if ((Ga1Temp1 == " DA")||(Ga1Temp1 == " DE")||(Ga1Temp1 == " DI")||(Ga1Temp1 == " DO")||(Ga1Temp1 == " DU"))
		{
			GaApelido = substr(GaApelido, 1, length(GaApelido) - 3)
			gsub(/[ ]*$|^[ ]*/, "", GaApelido)
		}
		Ga1Temp2 = substr(GaApelido, length(GaApelido) - 1, 2)
		if ((Ga1Temp2 == " A")||(Ga1Temp2 == " E")||(Ga1Temp2 == " I")||(Ga1Temp2 == " O")||(Ga1Temp2 == " U")||(Ga1Temp2 == " -"))
		{
			GaApelido = substr(GaApelido, 1, length(GaApelido) - 2)
			gsub(/[ ]*$|^[ ]*/, "", GaApelido)
		}
		if (GaApelido == "")
			GaApelido = substr(GaEntrada, 1, GaTamanho)
	}
	return GaApelido
}