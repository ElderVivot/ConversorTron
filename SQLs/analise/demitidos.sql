SELECT ctt.codempfol, ctt.matepgctt, pes.nomfun, res.dtaresctt
  FROM tblctt as ctt,
       tblresctt as res,
       tblpes as pes
 WHERE ctt.codempfol = res.codempfol
   AND ctt.matepgctt = res.matepgctt
   AND ctt.codpesepg = pes.codpes
order by 1, 2
