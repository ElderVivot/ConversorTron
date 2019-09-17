BEGIN{
	FS = ";";
	
	# ESOCIAL
	ArquivoEsocial = "..\\temp\\esocial.csv"
	while((getline < ArquivoEsocial) > 0){
		i_lote_f = $7
		
		codi_emp_f = $1
		
		chave_primaria_f = $4
		
		numero_recibo_f = $5
		
		id_recibo_f = $6
		
		i_evento_esocial_f = $2
		
		codigo_esocial_f = $3
		
		cnpj_servico_f = $8
		
		horario_entrada_f = $9
		
		horario_saida_f = $10
		
		ILoteV[codi_emp_f, i_evento_esocial_f, chave_primaria_f] = i_lote_f
		NumeroReciboV[codi_emp_f, i_evento_esocial_f, chave_primaria_f] = numero_recibo_f
		IDReciboV[codi_emp_f, i_evento_esocial_f, chave_primaria_f] = id_recibo_f
		CodigoEsocialV[codi_emp_f, i_evento_esocial_f, chave_primaria_f] = codigo_esocial_f
		CodigoEsocial_2[codi_emp_f, i_evento_esocial_f] = codigo_esocial_f
		CodigoEsocial_3[cnpj_servico_f, i_evento_esocial_f] = codigo_esocial_f
		CodigoEsocial_4[codi_emp_f, i_evento_esocial_f, chave_primaria_f, horario_entrada_f, horario_saida_f] = codigo_esocial_f
		ILoteV_2[codi_emp_f, i_evento_esocial_f] = i_lote_f
		ILoteV_3[codi_emp_f, i_evento_esocial_f, cnpj_servico_f] = i_lote_f
		ILoteV_4[cnpj_servico_f, i_evento_esocial_f] = i_lote_f
		ILoteV_5[codi_emp_f, i_evento_esocial_f, chave_primaria_f, horario_entrada_f, horario_saida_f] = i_lote_f
		
		#print codi_emp_f, i_evento_esocial_f, codigo_esocial_f, chave_primaria_f, CodigoEsocialV[codi_emp_f, i_evento_esocial_f, chave_primaria_f] > "..\\prontos\\_teste_esocial.csv"
		
	} close(ArquivoEsocial)
}

function RetornaILote(argCodiEmp, argIEventoEsocial, argChavePrimaria){
	ILoteFunction = ""
	
	codi_emp_f2 = ""
	codi_emp_f2 = argCodiEmp
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial
	
	chave_primaria_f2 = ""
	chave_primaria_f2 = argChavePrimaria
	
	if( ILoteV[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2] != "" )
		ILoteFunction = ILoteV[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2]
	else
		ILoteFunction = "NULO"
	
	return ILoteFunction
}

function RetornaNumeroRecibo(argCodiEmp2, argIEventoEsocial2, argChavePrimaria2){
	NumeroReciboFunction = ""
	
	codi_emp_f2 = ""
	codi_emp_f2 = argCodiEmp2
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial2
	
	chave_primaria_f2 = ""
	chave_primaria_f2 = argChavePrimaria2
	
	if( NumeroReciboV[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2] != "" )
		NumeroReciboFunction = NumeroReciboV[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2]
	else
		NumeroReciboFunction = "NULO"
	
	return NumeroReciboFunction
}

function RetornaIDRecibo(argCodiEmp3, argIEventoEsocial3, argChavePrimaria3){
	IDReciboFunction = ""
	
	codi_emp_f2 = ""
	codi_emp_f2 = argCodiEmp3
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial3
	
	chave_primaria_f2 = ""
	chave_primaria_f2 = argChavePrimaria3
	
	if( IDReciboV[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2] != "" )
		IDReciboFunction = IDReciboV[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2]
	else
		IDReciboFunction = "NULO"
	
	return IDReciboFunction
}

function RetornaCodigoEsocial(argCodiEmp4, argIEventoEsocial4, argChavePrimaria4){
	CodigoEsocialFunction = ""
	
	codi_emp_f2 = ""
	codi_emp_f2 = argCodiEmp4
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial4
	
	chave_primaria_f2 = ""
	chave_primaria_f2 = argChavePrimaria4
	
	if( CodigoEsocialV[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2] != "" )
		CodigoEsocialFunction = CodigoEsocialV[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2]
	else
		CodigoEsocialFunction = "NULO"
	
	return CodigoEsocialFunction
}

function RetornaCodigoEsocial_2(argCodiEmp5, argIEventoEsocial5){
	CodigoEsocial_2Function = ""
	
	codi_emp_f2 = ""
	codi_emp_f2 = argCodiEmp5
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial5
	
	if( CodigoEsocial_2[codi_emp_f2, i_evento_esocial_f2] != "" )
		CodigoEsocial_2Function = CodigoEsocial_2[codi_emp_f2, i_evento_esocial_f2]
	else
		CodigoEsocial_2Function = "NULO"
	
	return CodigoEsocial_2Function
}

function RetornaCodigoEsocial_3(argChavePrimaria9, argIEventoEsocial9){
	CodigoEsocial_3Function = ""
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial9
	
	chave_primaria_f2 = ""
	chave_primaria_f2 = argChavePrimaria9
	
	if( CodigoEsocial_3[chave_primaria_f2, i_evento_esocial_f2] != "" )
		CodigoEsocial_3Function = CodigoEsocial_3[chave_primaria_f2, i_evento_esocial_f2]
	else
		CodigoEsocial_3Function = "NULO"
	
	return CodigoEsocial_3Function
}

function RetornaCodigoEsocial_4(argCodiEmp10, argIEventoEsocial10, argChavePrimaria10, argHorarioEntrada10, argHorarioSaida10){
	CodigoEsocial_4Function = ""
	
	codi_emp_f2 = ""
	codi_emp_f2 = argCodiEmp10
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial10
	
	chave_primaria_f2 = ""
	chave_primaria_f2 = argChavePrimaria10
	
	horario_entrada_f2 = ""
	horario_entrada_f2 = argHorarioEntrada10
	
	horario_saida_f2 = ""
	horario_saida_f2 = argHorarioSaida10
	
	if( CodigoEsocial_4[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2, horario_entrada_f2, horario_saida_f2] != "" )
		CodigoEsocial_4Function = CodigoEsocial_4[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2, horario_entrada_f2, horario_saida_f2]
	else
		CodigoEsocial_4Function = "NULO"
	
	return CodigoEsocial_4Function
}

function RetornaILote_2(argCodiEmp6, argIEventoEsocial6){
	ILote_2Function = ""
	
	codi_emp_f2 = ""
	codi_emp_f2 = argCodiEmp6
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial6
	
	if( ILoteV_2[codi_emp_f2, i_evento_esocial_f2] != "" )
		ILote_2Function = ILoteV_2[codi_emp_f2, i_evento_esocial_f2]
	else
		ILote_2Function = "NULO"
	
	return ILote_2Function
}

function RetornaILote_3(argCodiEmp7, argIEventoEsocial7, argChavePrimaria7){
	ILote_3Function = ""
	
	codi_emp_f2 = ""
	codi_emp_f2 = argCodiEmp7
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial7
	
	chave_primaria_f2 = ""
	chave_primaria_f2 = argChavePrimaria7
	
	if( ILoteV_3[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2] != "" )
		ILote_3Function = ILoteV_3[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2]
	else
		ILote_3Function = "NULO"
	
	return ILote_3Function
}

function RetornaILote_4(argChavePrimaria8, argIEventoEsocial8){
	ILote_4Function = ""
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial8
	
	chave_primaria_f2 = ""
	chave_primaria_f2 = argChavePrimaria8
	
	if( ILoteV_4[chave_primaria_f2, i_evento_esocial_f2] != "" )
		ILote_4Function = ILoteV_4[chave_primaria_f2, i_evento_esocial_f2]
	else
		ILote_4Function = "NULO"
	
	return ILote_4Function
}

function RetornaILote_5(argCodiEmp11, argIEventoEsocial11, argChavePrimaria11, argHorarioEntrada11, argHorarioSaida11){
	ILote_5Function = ""
	
	codi_emp_f2 = ""
	codi_emp_f2 = argCodiEmp11
	
	i_evento_esocial_f2 = ""
	i_evento_esocial_f2 = argIEventoEsocial11
	
	chave_primaria_f2 = ""
	chave_primaria_f2 = argChavePrimaria11
	
	horario_entrada_f2 = ""
	horario_entrada_f2 = argHorarioEntrada11
	
	horario_saida_f2 = ""
	horario_saida_f2 = argHorarioSaida11
	
	if( ILoteV_5[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2, horario_entrada_f2, horario_saida_f2] != "" )
		ILote_5Function = ILoteV_5[codi_emp_f2, i_evento_esocial_f2, chave_primaria_f2, horario_entrada_f2, horario_saida_f2]
	else
		ILote_5Function = "NULO"
	
	return ILote_5Function
}