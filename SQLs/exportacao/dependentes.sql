@export on;
@export set filename="D:\conversores\TRON\Tron\dados\dependentes.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT * 
  FROM TBLDPDEPG 
ORDER BY CODPESEPG, CODDPDEPG;
@export off;
