@export on;
@export set filename="D:\conversores\TRON\Tron\dados\empresas_detalhe.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT emp_detalhe.*,
       (SELECT 1
          FROM TBLEMPCTB as emp_contabilidade
         WHERE emp_contabilidade.CODEMPCTB = emp_detalhe.codemp) as ucta_emp,
	   (SELECT 1
          FROM TBLEMPESC as emp_escrita
         WHERE emp_escrita.CODEMPESC = emp_detalhe.codemp) as uefi_emp,
        (SELECT MAX(tel.numtel)
           FROM TBLTEL as tel
	  WHERE tel.codemp = emp_detalhe.codemp) as telefone_emp,
	(SELECT MAX(cid.dddcid)
          FROM TBLCID as cid
         WHERE cid.codcid = (SELECT MAX(tel.codcid)
                               FROM TBLTEL as tel
                              WHERE tel.codemp = emp_detalhe.codemp) ) as ddd_emp
  FROM TBLEMPDET as emp_detalhe
ORDER BY emp_detalhe.CODEMP;
@export off;