SELECT forn.CODEMP,
       forn.CODEMPEMI,
       emp_geral.RAZSOCEMP,
       emp_geral.INSEMP,
       emp_geral.CODCID,
       emp_geral.CODNATJUR,
       emp_geral.INSMUNEMP,
       emp_geral.INSESTEMP,
       emp_geral.CODCLSATVCNADOI,
       emp_geral.CODSUBCLSATVCNADOI,
       emp_detalhe.nomfanemp,
       emp_detalhe.lgremp,
       emp_detalhe.numemp,
       emp_detalhe.baiemp,
       emp_detalhe.cepemp,
       emp_detalhe.emaemp,
       emp_detalhe.sitemp,
       emp_detalhe.andemp,
       emp_detalhe.salconemp,
       emp_detalhe.comemp,
       emp_detalhe.ctlemp,
       (SELECT MAX(tel.numtel)
           FROM TBLTEL as tel
	  WHERE tel.codemp = emp_detalhe.codemp) as telefone_emp,
	(SELECT MAX(cid.dddcid)
          FROM TBLCID as cid
         WHERE cid.codcid = (SELECT MAX(tel.codcid)
                               FROM TBLTEL as tel
                              WHERE tel.codemp = emp_detalhe.codemp) ) as ddd_emp
       
  FROM TBLEMPEMI as forn INNER JOIN TBLEMP as emp_geral
                           ON    forn.CODEMPEMI = emp_geral.CODEMP
                      INNER JOIN TBLEMPDET as emp_detalhe
                           ON    forn.CODEMPEMI = emp_detalhe.codemp

 WHERE forn.CODEMP <> forn.CODEMPEMI

ORDER BY forn.CODEMP, forn.CODEMPEMI