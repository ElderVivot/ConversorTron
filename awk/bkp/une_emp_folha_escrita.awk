BEGIN { 
	FS = ";"; 
	OFS = FS;
}
{
	if (FILENAME == ARGV[1]) # empresas da folha
	{
		fo = $1
		emp_folha[fo] = $1
		lin_folha[fo] = $0
		max_fo = emp_folha[fo]
	}
	if (FILENAME == ARGV[2]) # empresas da escrita
	{
		ef = $1
		emp_escrita[ef] = $1
		lin_escrita[ef] = $0
		max_ef = emp_escrita[ef]
	}
}
END{
	if (max_ef >= max_fo)
		n = max_ef
	else
		n = max_fo
	for (i=1; i<=n;i++)
	{
		#Print final -> dados da empresa, usa folha(0-Nao,1-Sim), usa escrita(0-Não,1-Sim)
		if ((emp_folha[i] != "")&&(emp_folha[i] == emp_escrita[i]))
			print lin_folha[i], 1, 1
		if ((emp_folha[i] != "")&&(emp_folha[i] != emp_escrita[i]))
			print lin_folha[i], 1, 0
		if ((emp_escrita[i] != "")&&(emp_escrita[i] != emp_folha[i]))
			print lin_escrita[i], 0, 1
	}
}
		