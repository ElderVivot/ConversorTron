@export on;
@export set filename="D:\conversores\TRON\Tron\dados\fun_pessoal.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT pessoa.*,
       (SELECT MAX(tel.numtel)
           FROM TBLTEL as tel
		  WHERE tel.codpes = pessoa.codpes
		    AND tel.tippes = pessoa.tippes) as telefone_pessoa,
       (SELECT MAX(cid.dddcid)
          FROM TBLCID as cid
         WHERE cid.codcid = (SELECT MAX(tel.codcid)
                               FROM TBLTEL as tel
                              WHERE tel.codpes = pessoa.codpes
                                AND tel.tippes = pessoa.tippes) ) as ddd_pessoa 	    
  FROM tblpes as pessoa
 WHERE pessoa.tippes = 'F'  
ORDER BY pessoa.codpes, pessoa.tippes;
@export off;

