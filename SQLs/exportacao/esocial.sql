@export on;
@export set filename="D:\conversores\TRON\Tron\dados\esocial.txt";
@export set BinaryFormat="Value";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT eso.codemp, eso.regmsgcomeso, eso.prorspmsgcomeso, eso.rspmsgcomeso, eso.numrcbeso, eso.xmlmsgcomeso, eso.matepgctt, eso.codpescbtind,
       eso.tippescbtind, eso.seqmovmen, eso.codsitepg, eso.codtipfol, eso.mesanofatgermovmen, eso.evegereso,
       ( SELECT MAX( s1005.codpestom )
           FROM tbllogs1005 AS s1005
          WHERE s1005.codempfol = eso.codemp
            AND s1005.codmsgcomeso = eso.codmsgcomeso
            AND eso.regmsgcomeso IN ( 'S-1005' ) ) AS i_servicos_1005,
       ( SELECT MAX( s1020.codlot )
           FROM tbllogs1020 AS s1020
          WHERE s1020.codempfol = eso.codemp
            AND s1020.codmsgcomeso = eso.codmsgcomeso
            AND eso.regmsgcomeso IN ( 'S-1020' ) ) AS i_servicos_1020,
       ( SELECT MAX( s1030.codocupro )
           FROM tbllogs1030 AS s1030
          WHERE s1030.codempfol = eso.codemp
            AND s1030.codmsgcomeso = eso.codmsgcomeso
            AND eso.regmsgcomeso IN ( 'S-1030' ) ) AS i_cargos,
       ( SELECT MAX( s1050.codhortrb )
           FROM tbllogs1050 AS s1050
          WHERE s1050.codmsgcomeso = eso.codmsgcomeso
            AND eso.regmsgcomeso IN ( 'S-1050' ) ) AS i_horario/*,    
       ( SELECT MAX( s1010.codeve )
           FROM tbllogs1010 AS s1010
          WHERE s1010.codempfol = eso.codemp
            AND s1010.codmsgcomeso = eso.codmsgcomeso
            AND eso.regmsgcomeso IN ( 'S-1010' ) ) AS i_eventos*/  
  FROM TBLMSGCOMESO AS eso
 WHERE eso.regmsgcomeso NOT IN ('S-1010' )
   AND eso.tipamb = 1
   AND eso.RSPMSGCOMESO LIKE '%201 - Suc%'
   --AND eso.codemp IN ( 15198 , 18315 , 71598 , 90068 , 103994 , 107101 )
ORDER BY eso.CODEMP, eso.REGMSGCOMESO;
@export off;