SELECT emp.codempfol as codigo_empresa, 
       ( SELECT tblemp.razsocemp
           FROM tblemp
          WHERE tblemp.codemp = emp.codempfol ) as razao_social,
       ( SELECT count(*)
           FROM tblctt as fun
          WHERE fun.codempfol = emp.codempfol ) as empregados,
       ( SELECT count(*)
           FROM tblcbtind as fun
          WHERE fun.codempfol = emp.codempfol ) as contribuintes
  FROM tblempfol as emp
ORDER BY emp.codempfol