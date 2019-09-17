@echo off
title Apaga Dados
set marcador=   ¯ 

echo.
echo    ±±±±±±±   ±±±±±±  ±±±    ±±± ±± ±±±   ±± ±±  ±±±±±± 
echo    ±±ßßßß±± ±±ßßßß±± ±±±±  ±±±± ßß ±±±±  ±± ßß ±±ßßßß±±
echo    ±±    ±± ±±    ±± ±±ß±±±±ß±± ±± ±±ß±± ±± ±± ±±    ±±
echo    ±±    ±± ±±    ±± ±± ß±±ß ±± ±± ±± ß±±±± ±± ±±    ±±
echo    ±±±±±±±ß ß±±±±±±ß ±±  ßß  ±± ±± ±±  ß±±± ±± ß±±±±±±ß
echo    ßßßßßßß   ßßßßßß  ßß      ßß ßß ßß   ßßß ßß  ßßßßßß 
echo                                        S I S T E M A S
echo.

if not exist ..\dados md ..\dados
if not exist ..\temp md ..\temp
if not exist ..\prontos md ..\prontos

set /P ApagaDados=Realmente deseja apagar os arquivos antigos [S/N] ? 

if %ApagaDados% == s ( set ApagaDados=S )
echo.

if %ApagaDados% == S ( 
if exist ..\dados\*.* del /q ..\dados\*.*
if exist ..\temp\*.* del /q ..\temp\*.*
if exist ..\prontos\*.* del /q ..\prontos\*.*
if exist ..\awk\empresas_converter.csv del /q ..\awk\empresas_converter.csv
echo Processo realizado! Foi excluido os arquivos da pasta "dados" e o arquivo "empresas_converter.csv" da pasta "awk"!
) else ( echo Processo cancelado! )

echo.
pause