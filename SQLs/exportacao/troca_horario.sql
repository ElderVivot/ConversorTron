@export on;
@export set filename="D:\conversores\TRON\Tron\dados\troca_horario.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT CODEMPFOL, MATEPGCTT, DTAHORTRBCTT, CODHORTRB
  FROM TBLHORTRBCTT
ORDER BY CODEMPFOL, MATEPGCTT, DTAHORTRBCTT;
@export off;