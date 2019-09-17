SELECT tblcttparsal.CODEMPFOL, tblcttparsal.MATEPGCTT, tblcttparsal.DTACTTPARSAL, tblcttparsal.DTAREACTTPARSAL, tblcttparsal.REFPARSAL, 
       ( SELECT MAX( tblano.dscano )
           FROM tblano as tblano
          WHERE tblano.codano = tblcttparsal.codano
            AND tblano.tipano = tblcttparsal.tipano ) as motivo
  FROM TBLCTTPARSAL AS tblcttparsal
 --WHERE CODEMPFOL IN (8)
ORDER BY CODEMPFOL, MATEPGCTT, DTAREACTTPARSAL