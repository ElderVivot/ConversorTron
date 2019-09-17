@export on;
@export set filename="D:\conversores\TRON\Tron\dados\empresas_folha.txt";
@export set BinaryFormat="Don't Export";
@export set CsvColumnDelimiter="|";
@export set CsvRemoveNewlines="true";
@export set CsvRowDelimiter="\r\n";
@export set Encoding="Cp1252";
SELECT empfol.codempfol, empfol.codfpa, empfol.codrecsfp, empfol.codgps, empfol.alqacitrbempfol,
       fpa.aliinsfolpagfpa, fpa.aliinsautfpa, fpa.aliinsprolabfpa,
       fpater.codterfpaoutent, 
       ( SELECT SUM( fpater2.alqterfpaoutent )
           FROM TBLFPAOUTENT as fpater2
          WHERE fpater2.codfpa = fpater.codfpa
            AND fpater2.codclafpa = fpater.codclafpa
            AND fpater2.codterfpaoutent = fpater.codterfpaoutent ) AS alqterfpaoutent
  FROM TBLEMPFOL AS empfol
       LEFT OUTER JOIN TBLTEROUTENTEMPFOL AS teremp
                 ON    teremp.codempfol = empfol.codempfol
       LEFT OUTER JOIN TBLFPA as fpa
                 ON    fpa.codfpa = teremp.codfpa
                   AND fpa.codclafpa = teremp.codclafpa
       LEFT OUTER JOIN TBLFPAOUTENT as fpater
                 ON    fpater.codfpa = teremp.codfpa
                   AND fpater.codclafpa = teremp.codclafpa
                   AND fpater.codoutent = teremp.codoutent
                   AND fpater.codterfpaoutent = teremp.codterfpaoutent
 WHERE ( teremp.codoutent = ( SELECT MAX( teremp2.codoutent )
                                FROM TBLTEROUTENTEMPFOL AS teremp2
                               WHERE teremp2.codempfol = empfol.codempfol ) 
         OR teremp.codoutent IS NULL )
ORDER BY 1;
@export off;
