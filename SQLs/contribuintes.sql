SELECT TBLCBTIND.*, TBLPES.*,
       (SELECT MAX(tel.numtel)
          FROM TBLTEL as tel
         WHERE tel.codpes = TBLPES.codpes
           AND tel.tippes = TBLPES.tippes) as telefone_pessoa,
       (SELECT MAX(cid.dddcid)
          FROM TBLCID as cid
         WHERE cid.codcid = (SELECT MAX(tel.codcid)
                               FROM TBLTEL as tel
                              WHERE tel.codpes = TBLPES.codpes
                                AND tel.tippes = TBLPES.tippes) ) as ddd_pessoa 
  FROM TBLCBTIND, TBLPES
 WHERE TBLCBTIND.CODPESCBTIND = TBLPES.CODPES
   AND TBLCBTIND.TIPPESCBTIND = TBLPES.TIPPES
   --AND TBLCBTIND.CODEMPFOL IN (185)
   --AND TBLCBTIND.CODCAT NOT IN (11)
ORDER BY TBLCBTIND.CODEMPFOL, TBLCBTIND.CODPESCBTIND