SELECT TBLCTTPARSAL.CODEMPFOL
     , TBLCTTPARSAL.MATEPGCTT
     , TBLCTTPARSAL.DTACTTPARSAL
	 , IIF(REFPARSAL IS NULL,
(SELECT MAX(VLRSALOCUPRO)
   FROM TBLCTTOCUPRO, TBLSALOCUPRO
  WHERE TBLCTTOCUPRO.CODEMPFOL = TBLCTTPARSAL.CODEMPFOL
    AND TBLCTTOCUPRO.MATEPGCTT = TBLCTTPARSAL.MATEPGCTT
    AND TBLSALOCUPRO.CODEMPFOL = TBLCTTOCUPRO.CODEMPFOL
    AND TBLSALOCUPRO.CODOCUPRO = TBLCTTOCUPRO.CODOCUPRO)
	 , TBLCTTPARSAL.REFPARSAL) AS REFPARSAL     
	 , TBLCTTPARSAL.FORREACTTPARSAL
	 , TBLCTTPARSAL.VLRREACTTPARSAL
FROM TBLCTTPARSAL
ORDER BY 1,2