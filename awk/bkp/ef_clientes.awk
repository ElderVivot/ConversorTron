BEGIN { FS = ""; OFS = "\t"}
{
	#Ignora o cabeçalho do arquivo
	if ((substr($0,1,6) == "CODEMP")||(substr($0,1,6) == "======")) next
	gsub("[\t]"," ", $0)
	codi_emp = substr($0,1,10)
	codi_cli = substr($0,11,13)
	nome_cli = substr($0,24,85)
	tins_cli = substr($0,109,13)
	cgce_cli = substr($0,122,23)
	CADASTRO_CLI = substr($0,145,16)
	imun_cli = substr($0,194,23)
	insc_cli = substr($0,217,23)
	ende_cli = substr($0,245,85)
	nume_cli = substr($0,335,15)
	bair_cli = substr($0,350,85)
	cepe_cli = substr($0,435,13)
	cida_cli = substr($0,448,45)
	sigl_est = substr($0,493,14)
	formatar()
	if (CADASTRO_CLI == "") CADASTRO_CLI = "Data atual"
	gsub("[^0-9]","",cgce_cli)
	gsub("[^0-9]","",cepe_cli)
	gsub("[^0-9]","",nume_cli)
	if (length(cepe_cli ) < 8) cepe_cli = ""
	nomr_cli = GeraApelido(nome_cli, 10)
	if (tins_cli == 1) tins_cli = 1
	else if (tins_cli == 3) tins_cli = 2
	else tins_cli = 3
	print codi_emp, codi_cli, nomr_cli, tins_cli, cgce_cli, nome_cli, ende_cli, nume_cli, bair_cli, cepe_cli, cida_cli, sigl_est, insc_cli, 
	imun_cli, CADASTRO_CLI > "..\\temp\\clientes.txt"
}
function formatar()
{
	gsub(/[ ]*$|^[ ]*/,"",codi_emp)
	if (codi_emp == "<null>") codi_emp = ""
	gsub(/[ ]*$|^[ ]*/,"",codi_cli)
	if (codi_cli == "<null>") codi_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",nome_cli)
	if (nome_cli == "<null>") nome_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",tins_cli)
	if (tins_cli == "<null>") tins_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",cgce_cli)
	if (cgce_cli == "<null>") cgce_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",CADASTRO_CLI)
	if (CADASTRO_CLI == "<null>") CADASTRO_CLI = ""
	gsub(/[ ]*$|^[ ]*/,"",imun_cli)
	if (imun_cli == "<null>") imun_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",insc_cli)
	if (insc_cli == "<null>") insc_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",ende_cli)
	if (ende_cli == "<null>") ende_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",nume_cli)
	if (nume_cli == "<null>") nume_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",bair_cli)
	if (bair_cli == "<null>") bair_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",cepe_cli)
	if (cepe_cli == "<null>") cepe_cli = ""
	gsub(/[ ]*$|^[ ]*/,"",cida_cli)
	if (cida_cli == "<null>") cida_cli = ""
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