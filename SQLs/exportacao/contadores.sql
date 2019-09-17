@export on;
@export set filename="D:\conversores\TRON\Tron\dados\contadores.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT con.*,
       ( SELECT tpend.dsctiplog
           FROM tbltiplog AS tpend
          WHERE tpend.codtiplog = con.codtiplog ) AS tipo_ende
  FROM tblect AS con
       INNER JOIN tblectfun AS conver
            ON    conver.codect = con.codect
ORDER BY 1;
@export off;