@export on;
@export set filename="D:\conversores\TRON\Tron\dados\troca_ccustos.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT CODEMPFOL, MATEPGCTT, DTACTTSEC, CODSEC
  FROM TBLCTTSEC
ORDER BY CODEMPFOL, MATEPGCTT, DTACTTSEC;
@export off;
