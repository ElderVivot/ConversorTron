BEGIN {
	FS = "|";
	
	# ARQUIVOS COM DADOS EXPORTADOS, OU SEJA, A CONSULTA (SQL) TROUXE RESULTADOS
	system("if exist ..\\dados\\*.txt dir /b ..\\dados\\*.txt > filelist.txt");
	filelist = "filelist.txt";
	
	while( ( getline < filelist ) > 0 ) {
		
		linha = 0;
		
		ifile = "..\\dados\\" $0;
		
		nome_arquivo = substr( $0, 1, length($0) - 4 )
		
		ofile = "..\\dados\\" nome_arquivo ".csv" ;
		
		ArquivoProcessado[nome_arquivo] = 1
		
		while( ( getline < ifile ) > 0 ) {
			
			arquivo = $0;
			gsub(";", ",", arquivo );
			gsub(/[|]/, ";", arquivo );
			
			linha++;
			
			print arquivo > ofile;
		
		} close(ifile);
		
		if( linha <= 0 ){
			print "" > ofile
		}
		
		close(ofile);
	
	} close(filelist);
	
	# ARQUIVOS SEM DADOS EXPORTADOS, OU SEJA, A CONSULTA (SQL) NÃO TROUXE RESULTADOS
	system("if exist ..\\sqls\\*.sql dir /b ..\\sqls\\*.sql > filelistsql.txt");
	filelistsql = "filelistsql.txt";
	
	while( ( getline < filelistsql ) > 0 ) {
		
		nome_arquivo_sql = substr( $0, 1, length($0) - 4 )
		
		ofilesql = "..\\dados\\" nome_arquivo_sql ".csv" ;
				
		if( match(nome_arquivo_sql, "rubricas_contribuicao_sindical" ) == 0 && ArquivoProcessado[nome_arquivo_sql] == 0 ){
			print "" > ofilesql
		}
		
		close(ofilesql);
	
	} close(filelistsql);
	
	system("if exist filelist.txt del /q filelist.txt > nul");
	system("if exist filelistsql.txt del /q filelistsql.txt > nul");
}