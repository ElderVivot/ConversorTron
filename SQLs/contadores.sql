SELECT con.*,
       ( SELECT tpend.dsctiplog
           FROM tbltiplog AS tpend
          WHERE tpend.codtiplog = con.codtiplog ) AS tipo_ende
  FROM tblect AS con
       INNER JOIN tblectfun AS conver
            ON    conver.codect = con.codect
ORDER BY 1