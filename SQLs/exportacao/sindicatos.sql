@export on;
@export set filename="D:\conversores\TRON\Tron\dados\sindicatos.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT 	TBLSIN.CODSIN,
		TBLSIN.TIPSIN,
		TBLSIN.NOMSIN,
		TBLSIN.LOGSIN,
		TBLSIN.NUMSIN,
		TBLSIN.BAISIN,
		TBLSIN.CEPSIN,
		TBLSIN.SITSIN,
		TBLSIN.VLRCONSIN,
		TBLSIN.DIAMESBASCONSIN,
		TBLSIN.PRAEXPCON,
		TBLSIN.MESCALEVEMEDSIN,
		TBLSIN.MAIMESCALMEDSIND,
		TBLSIN.EMASIN,
		TBLSIN.CODCID,
		TBLSIN.MESBASAUMSIN,
		TBLSIN.HORSEMSIN,
		TBLSIN.TEMCONEXPSIN,
		TBLSIN.PRAHOMRESSIN,
		TBLSIN.SALINCSIN,
		TBLSIN.ACUTEMSERSIN,
		TBLSIN.CODSINSIN,
		TBLSIN.PERCALEVEMEDSINEVEMED,
		TBLSIN.DIACALBASSINEVEMED,
		TBLSIN.CALMDA,
		TBLSIN.FRMCALSLDSAL,
		TBLSIN.INSSIN,
		TBLSIN.FRMCALSALMESSIN,
		TBLSIN.CALDOIDIAFEVSIN,
		TBLSIN.INCMDAFRSCAL,
		TBLSIN.CALEVEMENPRO,
		TBLSIN.CALMDADECTERAVOMES,
		TBLSIN.CALDESDIFDECTER,
		TBLSIN.CALDSR,
		(SELECT TBLCID.NOMCID FROM TBLCID WHERE TBLSIN.CODCID = TBLCID.CODCID ) AS CIDADE,
		(SELECT TBLCID.CODUNDFED FROM TBLCID WHERE TBLSIN.CODCID = TBLCID.CODCID ) AS ESTADO,
	(SELECT MAX(tel.numtel)
           FROM TBLTEL as tel
          WHERE tel.codsin = TBLSIN.codsin
            AND tel.tipsin = TBLSIN.tipsin) as telefone_sind,
        (SELECT MAX(cid.dddcid)
          FROM TBLCID as cid
         WHERE cid.codcid = (SELECT MAX(tel.codcid)
                               FROM TBLTEL as tel
                              WHERE tel.codsin = TBLSIN.codsin
                                AND tel.tipsin = TBLSIN.tipsin) ) as ddd_sind
FROM TBLSIN
ORDER BY TBLSIN.CODSIN, TBLSIN.TIPSIN;
@export off;
