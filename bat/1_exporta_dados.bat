@echo off
title Exportador Tron - Windows
set marcador=   ¯ 

if not exist ..\dados md ..\dados
if not exist ..\temp md ..\temp
if not exist ..\prontos md ..\prontos

if exist ..\dados\*.* del /q ..\dados\*.*

echo.
echo    ±±±±±±±   ±±±±±±  ±±±    ±±± ±± ±±±   ±± ±±  ±±±±±± 
echo    ±±ßßßß±± ±±ßßßß±± ±±±±  ±±±± ßß ±±±±  ±± ßß ±±ßßßß±±
echo    ±±    ±± ±±    ±± ±±ß±±±±ß±± ±± ±±ß±± ±± ±± ±±    ±±
echo    ±±    ±± ±±    ±± ±± ß±±ß ±± ±± ±± ß±±±± ±± ±±    ±±
echo    ±±±±±±±ß ß±±±±±±ß ±±  ßß  ±± ±± ±±  ß±±± ±± ß±±±±±±ß
echo    ßßßßßßß   ßßßßßß  ßß      ßß ßß ßß   ßßß ßß  ßßßßßß 
echo                                        S I S T E M A S
echo.
echo    Exportador Tron Windows

rem  ========>>>  Iniciando Conversao do dados
echo.
echo    Iniciando a exportacÆo de dados...
echo.

echo %marcador%Exportando cargos
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\cargos.sql" > ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando ccustos
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\ccustos.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando contadores
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\contadores.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando eSocial
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\esocial.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando contribuintes
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\contribuintes.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando departamentos
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\departamentos.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando dependentes
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\dependentes.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando empresas_detalhe
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\empresas_detalhe.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando empresas_folha
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\empresas_folha.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando empresas_geral
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\empresas_geral.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando ferias
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\ferias.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando contribuicao sindical
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\contribuicao_sindical.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando fun_certidoes_civis
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\fun_certidoes_civis.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando fun_contratuais
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\fun_contratuais.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando fun_dados
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\fun_dados.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando fun_pessoal
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\fun_pessoal.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando horarios_cod_nome
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\horarios_cod_nome.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando horarios_intervalos
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\horarios_intervalos.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando horarios_semana
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\horarios_semana.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando horarios_semana_intervalo
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\horarios_semana_intervalo.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando rescisao
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\rescisao.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando responsaveis
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\responsaveis.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando servicos
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\servicos.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando sindicatos
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\sindicatos.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando socios
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\socios.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando transferidos_fun
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\transferidos_fun.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando troca_cargo
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\troca_cargo.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando troca_ccustos
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\troca_ccustos.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando troca_depto
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\troca_depto.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando troca_horario
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\troca_horario.sql" >> ..\dados\log.txt
echo. >> ..\dados\log.txt

echo %marcador%Exportando troca_salario
call "C:\Program Files\DbVisualizer\dbviscmd.bat" -connection "tron" -sqlfile "D:\conversores\TRON\Tron\SQLs\exportacao\troca_salario.sql" >> ..\dados\log.txt
echo.

pause