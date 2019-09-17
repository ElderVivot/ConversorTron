SELECT ctt.*, pes.*, epg.*,
       (SELECT MAX(tel.numtel)
           FROM TBLTEL as tel
		  WHERE tel.codpes = pes.codpes
		    AND tel.tippes = pes.tippes) as telefone_pessoa,
       (SELECT MAX(cid.dddcid)
          FROM TBLCID as cid
         WHERE cid.codcid = (SELECT MAX(tel.codcid)
                               FROM TBLTEL as tel
                              WHERE tel.codpes = pes.codpes
                                AND tel.tippes = pes.tippes) ) as ddd_pessoa 
  FROM tblctt as ctt,
       tblpes as pes,
       tblepg as epg
 WHERE ctt.codpesepg = pes.codpes
   AND ctt.codpesepg = epg.codpesepg
   --AND ctt.codempfol IN (8)
   AND ctt.tippesepg = pes.tippes
   --AND ctt.codbcofgt IS NOT NULL
   --AND ( /*ctt.insempant IS NOT NULL OR*/ ctt.mattraempant IS NOT NULL )
   --AND epg.tipcerciv IS NOT NULL
order by 1, 2
