@export on;
@export set filename="D:\conversores\TRON\Tron\dados\empresas_geral.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT *
  FROM TBLEMP
ORDER BY 1;
@export off;
