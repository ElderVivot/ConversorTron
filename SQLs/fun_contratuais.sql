SELECT TBLCTT.*,
       (SELECT MAX(ctt_cargo.CODOCUPRO)
	      FROM TBLCTTOCUPRO as ctt_cargo
		 WHERE ctt_cargo.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_cargo.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_cargo.DTACTTOCUPRO = (SELECT MAX(ctt_cargo_2.DTACTTOCUPRO)
	                                       FROM TBLCTTOCUPRO as ctt_cargo_2
					                      WHERE ctt_cargo_2.CODEMPFOL = ctt_cargo.CODEMPFOL
					                        AND ctt_cargo_2.MATEPGCTT = ctt_cargo.MATEPGCTT) ) as i_cargos,
		(SELECT MAX(ctt_depto.CODDEP)
	      FROM TBLCTTDEP as ctt_depto
		 WHERE ctt_depto.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_depto.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_depto.DTACTTDEP = (SELECT MAX(ctt_depto_2.DTACTTDEP)
	                                       FROM TBLCTTDEP as ctt_depto_2
					                      WHERE ctt_depto_2.CODEMPFOL = ctt_depto.CODEMPFOL
					                        AND ctt_depto_2.MATEPGCTT = ctt_depto.MATEPGCTT) ) as i_depto,
		(SELECT MAX(ctt_sec.CODSEC)
	      FROM TBLCTTSEC as ctt_sec
		 WHERE ctt_sec.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_sec.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_sec.DTACTTSEC = (SELECT MAX(ctt_sec_2.DTACTTSEC)
	                                       FROM TBLCTTSEC as ctt_sec_2
					                      WHERE ctt_sec_2.CODEMPFOL = ctt_sec.CODEMPFOL
					                        AND ctt_sec_2.MATEPGCTT = ctt_sec.MATEPGCTT) ) as i_ccustos,
		(SELECT MAX(ctt_hor.CODHORTRB)
	      FROM TBLHORTRBCTT as ctt_hor
		 WHERE ctt_hor.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_hor.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_hor.DTAHORTRBCTT = (SELECT MAX(ctt_hor_2.DTAHORTRBCTT)
	                                       FROM TBLHORTRBCTT as ctt_hor_2
					                      WHERE ctt_hor_2.CODEMPFOL = ctt_hor.CODEMPFOL
					                        AND ctt_hor_2.MATEPGCTT = ctt_hor.MATEPGCTT) ) as i_jornada,
		(SELECT MAX(ctt_cat.CODTIPPGT)
	      FROM TBLCTTTIPPGT as ctt_cat
		 WHERE ctt_cat.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_cat.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_cat.DTAFINCONTIPPGT = (SELECT MAX(ctt_cat_2.DTAFINCONTIPPGT)
	                                       FROM TBLCTTTIPPGT as ctt_cat_2
					                      WHERE ctt_cat_2.CODEMPFOL = ctt_cat.CODEMPFOL
					                        AND ctt_cat_2.MATEPGCTT = ctt_cat.MATEPGCTT) ) as categoria,
		(SELECT MAX(ctt_sal.REFPARSAL)
	       FROM TBLCTTPARSAL as ctt_sal
		  WHERE ctt_sal.CODEMPFOL = TBLCTT.CODEMPFOL
		    AND ctt_sal.MATEPGCTT = TBLCTT.MATEPGCTT
			AND ctt_sal.DTAREACTTPARSAL = (SELECT MAX(ctt_sal_2.DTAREACTTPARSAL)
	                                       FROM TBLCTTPARSAL as ctt_sal_2
					                      WHERE ctt_sal_2.CODEMPFOL = ctt_sal.CODEMPFOL
					                        AND ctt_sal_2.MATEPGCTT = ctt_sal.MATEPGCTT) ) as salario,
		(SELECT MAX(faixa_sal.VLRADIHRSATVCTTFAISAL)
	       FROM TBLCTTFAISAL as faixa_sal
		  WHERE faixa_sal.CODEMPFOL = TBLCTT.CODEMPFOL
		    AND faixa_sal.MATEPGCTT = TBLCTT.MATEPGCTT
			/* AND faixa_sal.DTAREACTTPARSAL = (SELECT MAX(faixa_sal_2.DTAREACTTPARSAL)
	                                       FROM TBLCTTFAISAL as faixa_sal_2
					                      WHERE faixa_sal_2.CODEMPFOL = faixa_sal.CODEMPFOL
					                        AND faixa_sal_2.MATEPGCTT = faixa_sal.MATEPGCTT)*/ ) as salario_professor,
		(SELECT MAX(ctt_tom.codpestom)
	       FROM TBLCTTTOM as ctt_tom
		  WHERE ctt_tom.CODEMPFOL = TBLCTT.CODEMPFOL
		    AND ctt_tom.MATEPGCTT = TBLCTT.MATEPGCTT
			AND ctt_tom.DTACTTTOM = (SELECT MAX(ctt_tom_2.DTACTTTOM)
	                                       FROM TBLCTTTOM as ctt_tom_2
					                      WHERE ctt_tom_2.CODEMPFOL = ctt_tom.CODEMPFOL
					                        AND ctt_tom_2.MATEPGCTT = ctt_tom.MATEPGCTT) ) as i_servicos,
       ( SELECT MAX( tblbco.nombco )
           FROM tblbco as tblbco
          WHERE tblbco.codbco = tblctt.codbcosal ) AS nome_banco,
       ( SELECT MAX( tblconcor.tipconcor )
           FROM tblconcor AS tblconcor
          WHERE tblconcor.codbco = tblctt.codbcosal
            AND tblconcor.codage = tblctt.codagesal
            AND tblconcor.codconcor = tblctt.codconcorsal
            AND ( tblconcor.digverconcor = tblctt.digverconcorsal OR tblconcor.digverconcor IS NULL ) ) AS tipo_conta
  FROM tblctt as TBLCTT
 --WHERE tblctt.codempfol IN (6199)
   --AND tblctt.dtadesctt IS NULL
   --AND tblctt.codsin NOT IN (1, 3, 5, 11, 13)
ORDER BY TBLCTT.CODEMPFOL, TBLCTT.MATEPGCTT
