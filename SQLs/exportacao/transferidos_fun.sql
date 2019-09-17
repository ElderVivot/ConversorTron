@export on;
@export set filename="D:\conversores\TRON\Tron\dados\transferidos_fun.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT sit.codempfol, sit.matepgctt, pes.nomfun, sit.dtaconsitemp
  FROM TBLCTTSIT AS sit
       INNER JOIN tblctt AS ctt
            ON    ctt.codempfol = sit.codempfol
              AND ctt.matepgctt = sit.matepgctt
       INNER JOIN tblpes AS pes
            ON    pes.codpes = ctt.codpesepg
              AND pes.tippes = ctt.tippesepg
 WHERE sit.CODSITEPG IN (38)
   AND NOT EXISTS ( SELECT 1
                      FROM tblresctt AS res
                     WHERE res.codempfol = sit.codempfol
                       AND res.matepgctt = sit.matepgctt )
ORDER BY 1, 2, 4;
@export off;

