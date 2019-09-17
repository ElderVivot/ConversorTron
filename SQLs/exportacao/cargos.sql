@export on;
@export set filename="D:\conversores\TRON\Tron\dados\cargos.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT TBLOCUPRO.*
  FROM TBLOCUPRO
ORDER BY 1, 2;
@export off;