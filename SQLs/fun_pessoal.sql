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
ORDER BY pessoa.codpes, pessoa.tippes
