@export on;
@export set filename="D:\conversores\TRON\Tron\dados\socios.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT TBLSCORSP.*,
       (SELECT TBLCRG.DSCCRG
          FROM TBLCRG
         WHERE TBLSCORSP.CODCRG = TBLCRG.CODCRG) AS DESCCAR 
  FROM TBLSCORSP 
ORDER BY 1;
@export off;
