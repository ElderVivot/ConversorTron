SELECT tblitemovmen.codempfol, tblmovmen.matepgctt,
       /*( SELECT MAX( pes.nomfun )
           FROM tblctt as ctt
                INNER JOIN tblpes as pes
                     ON    pes.codpes = ctt.codpesepg
          WHERE ctt.codempfol = tblmovmen.codempfol
            AND ctt.matepgctt = tblmovmen.matepgctt ),*/ 
       tblmovmen.codsitepg, tblmovmen.codtipfol, tblmovmen.mesanoincmovmen, tblitemovmen.codeve, 
       tbleve.dsceve, tblitemovmen.refitemovmen, tblitemovmen.vlrtoteveitemovmen, tblitemovmen.natitemovmen
  FROM TBLITEMOVMEN
       INNER JOIN TBLMOVMEN
            ON    tblmovmen.codempfol = tblitemovmen.codempfol
              AND tblmovmen.codsitepg = tblitemovmen.codsitepg
              AND tblmovmen.seqmovmen = tblitemovmen.seqmovmen
              AND tblmovmen.codtipfol = tblitemovmen.codtipfol
              AND tblmovmen.mesanofatgermovmen = tblitemovmen.mesanofatgermovmen
       INNER JOIN tbleve
            ON    tbleve.codeve = tblitemovmen.codeve
            
 WHERE tblmovmen.matepgctt IS NOT NULL
  --AND tblitemovmen.codempfol IN (11)
ORDER BY tblitemovmen.codempfol, tblmovmen.matepgctt, tblmovmen.mesanoincmovmen