@export on;
@export set filename="D:\conversores\TRON\Tron\dados\troca_cargo.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT CODEMPFOL, MATEPGCTT, DTACTTOCUPRO, CODOCUPRO
  FROM TBLCTTOCUPRO
ORDER BY CODEMPFOL, MATEPGCTT, DTACTTOCUPRO;
@export off;
