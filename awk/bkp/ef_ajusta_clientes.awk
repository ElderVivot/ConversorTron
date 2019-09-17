BEGIN { FS = "\t"; OFS = "\t"}
{
	if (FILENAME == "..\\awk\\MunicipiosDomSis.txt")
	{
		i = $3"-"$2
		i_cid_est[i] = $3"-"$2
		i_codi_mun[i] = $1
	}
	else
	{
		o = $11"-"$12
		i_cid_est[o] = i_cid_est[o]
		if (i_cid_est[o] != "")
			codigo_municipio = i_codi_mun[o]
		else
			codigo_municipio = "NULO"
			
		print $0, codigo_municipio > "..\\prontos\\clientes.txt"
	}
}