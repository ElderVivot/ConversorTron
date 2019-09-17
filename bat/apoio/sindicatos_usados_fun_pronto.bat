awk95 -f ..\awk\sindicatos_usados_fun_pronto.awk ..\prontos\empregados.csv > ..\temp\sindicatos_usados.csv
sort ..\temp\sindicatos_usados.csv > ..\prontos\sindicatos_usados.csv

pause