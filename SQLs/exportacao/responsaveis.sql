@export on;
@export set filename="D:\conversores\TRON\Tron\dados\responsaveis.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT TBLSCORSPEMP.CODEMP, 
       TBLSCORSP.*,
       (SELECT TBLCRG.DSCCRG
          FROM TBLCRG
         WHERE TBLSCORSP.CODCRG = TBLCRG.CODCRG) AS DESCCAR
  FROM TBLSCORSPEMP, TBLSCORSP
 WHERE TBLSCORSPEMP.CODSCORSP = TBLSCORSP.CODSCORSP
   AND TBLSCORSPEMP.TIPSCORSP = 'R'
ORDER BY TBLSCORSPEMP.CODEMP;
@export off;