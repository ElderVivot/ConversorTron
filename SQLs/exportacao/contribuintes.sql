@export on;
@export set filename="D:\conversores\TRON\Tron\dados\contribuintes.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT TBLCBTIND.*, TBLPES.*,
       (SELECT MAX(tel.numtel)
          FROM TBLTEL as tel
         WHERE tel.codpes = TBLPES.codpes
           AND tel.tippes = TBLPES.tippes) as telefone_pessoa,
       (SELECT MAX(cid.dddcid)
          FROM TBLCID as cid
         WHERE cid.codcid = (SELECT MAX(tel.codcid)
                               FROM TBLTEL as tel
                              WHERE tel.codpes = TBLPES.codpes
                                AND tel.tippes = TBLPES.tippes) ) as ddd_pessoa 
  FROM TBLCBTIND, TBLPES
 WHERE TBLCBTIND.CODPESCBTIND = TBLPES.CODPES
   AND TBLCBTIND.TIPPESCBTIND = TBLPES.TIPPES
ORDER BY TBLCBTIND.CODEMPFOL, TBLCBTIND.CODPESCBTIND;
@export off;