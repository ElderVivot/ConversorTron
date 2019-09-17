BEGIN {
	FS = ";";
	OFS = FS;
	
	# --------- EMPREGADOS ------------
	ArquivoEmpregados = "..\\prontos\\6_foempregados.csv"
	while((getline < ArquivoEmpregados) > 0){
		i_sindicatos = $56
		i_bancos = $41
		
		ISindicatos[i_sindicatos] = i_sindicatos
		IBancos[i_bancos] = i_bancos
	} close(ArquivoEmpregados)
	
	# --------- EMPREGADOS TRANSFERIDOS DEPENDENTES ------------
	ArquivoEmpregados_2 = "..\\prontos\\6_foempregados_transferidos_dependentes.csv"
	while((getline < ArquivoEmpregados_2) > 0){
		i_sindicatos_2 = $56
		i_bancos_2 = $41
		
		ISindicatos[i_sindicatos_2] = i_sindicatos_2
		IBancos[i_bancos_2] = i_bancos_2
	} close(ArquivoEmpregados_2)
	
	# --------- EMPREGADOS TRANSFERIDOS INDEPENDENTES ------------
	ArquivoEmpregados_3 = "..\\prontos\\6_foempregados_transferidos_independentes.csv"
	while((getline < ArquivoEmpregados_3) > 0){
		i_sindicatos_3 = $56
		i_bancos_3 = $41
		
		ISindicatos[i_sindicatos_3] = i_sindicatos_3
		IBancos[i_bancos_3] = i_bancos_3
	} close(ArquivoEmpregados_3)
	
	# --------- FOHISTEMPRANT ------------
	ArquivoFOHistemprant = "..\\prontos\\7_fohistemprant.csv"
	while((getline < ArquivoFOHistemprant) > 0){
		i_sindicatos_4 = $14
		
		ISindicatos[i_sindicatos_4] = i_sindicatos_4
	} close(ArquivoFOHistemprant)
	
	# --------- FOALTESAL ------------
	ArquivoFOAltesal = "..\\prontos\\9_foaltesal.csv"
	while((getline < ArquivoFOAltesal) > 0){
		i_codigo = $5
		
		ICodigo[i_codigo] = i_codigo
	} close(ArquivoFOAltesal)
	
	# *********** IMPRIMME OS DADOS ************
	
	# --------- FOSINDICATOS ------------
	ArquivoFOSindicatos = "..\\temp\\2_fosindicatos.csv"
	while((getline < ArquivoFOSindicatos) > 0){
		i_sindicatos_ori = $2
		
		if( ISindicatos[i_sindicatos_ori] != "" )
			print $0 > "..\\prontos\\2_fosindicatos.csv"
		
	} close(ArquivoFOSindicatos)
	
	# --------- FOBANCOS ------------
	ArquivoFOBancos = "..\\temp\\2_fobancos.csv"
	while((getline < ArquivoFOBancos) > 0){
		i_bancos_ori = $1
		
		if( IBancos[i_bancos_ori] != "" )
			print $0 > "..\\prontos\\2_fobancos.csv"
		
	} close(ArquivoFOBancos)
	
	# --------- FOTABELAS ------------
	ArquivoFOTabelas = "..\\temp\\3_fotabelas.csv"
	while((getline < ArquivoFOTabelas) > 0){
		i_codigo_ori = $2
		
		if( ICodigo[i_codigo_ori] != "" )
			print $0 > "..\\prontos\\3_fotabelas.csv"
		
	} close(ArquivoFOTabelas)
	
}
