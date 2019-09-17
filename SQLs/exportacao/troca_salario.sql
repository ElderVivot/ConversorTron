@export on;
@export set filename="D:\conversores\TRON\Tron\dados\troca_salario.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT tblcttparsal.CODEMPFOL, tblcttparsal.MATEPGCTT, tblcttparsal.DTACTTPARSAL, tblcttparsal.DTAREACTTPARSAL, tblcttparsal.REFPARSAL, 
       ( SELECT MAX( tblano.dscano )
           FROM tblano as tblano
          WHERE tblano.codano = tblcttparsal.codano
            AND tblano.tipano = tblcttparsal.tipano ) as motivo
  FROM TBLCTTPARSAL AS tblcttparsal
ORDER BY CODEMPFOL, MATEPGCTT, DTAREACTTPARSAL;
@export off;