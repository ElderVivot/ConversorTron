@echo off
title Conversor Tron - Windows
set marcador=   ¯ 

if exist ..\temp\*.* del /q ..\temp\*.*
if exist ..\prontos\*.* del /q ..\prontos\*.*

echo.
echo    ±±±±±±±   ±±±±±±  ±±±    ±±± ±± ±±±   ±± ±±  ±±±±±± 
echo    ±±ßßßß±± ±±ßßßß±± ±±±±  ±±±± ßß ±±±±  ±± ßß ±±ßßßß±±
echo    ±±    ±± ±±    ±± ±±ß±±±±ß±± ±± ±±ß±± ±± ±± ±±    ±±
echo    ±±    ±± ±±    ±± ±± ß±±ß ±± ±± ±± ß±±±± ±± ±±    ±±
echo    ±±±±±±±ß ß±±±±±±ß ±±  ßß  ±± ±± ±±  ß±±± ±± ß±±±±±±ß
echo    ßßßßßßß   ßßßßßß  ßß      ßß ßß ßß   ßßß ßß  ßßßßßß 
echo                                        S I S T E M A S
echo.
echo    Conversor Tron Windows

rem  ========>>>  Iniciando Conversao do dados
echo.
echo    Iniciando a conversÆo de dados...

REM --> EMPRESAS
echo %marcador%Convertendo clientes e fornecedores
awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_municipio.awk -f ..\awk\codigo_outros.awk -f ..\awk\clientes.awk ..\dados\clientes.csv > ..\temp\clientes.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_municipio.awk -f ..\awk\codigo_outros.awk -f ..\awk\fornecedores.awk ..\dados\fornecedores.csv > ..\temp\fornecedores.csv

REM --> VINCULA NOVOS CODIGOS SE NECESSARIO
echo. Filtrando empresas e vinculando novo codigo se informado
awk95 -f ..\awk\codigo_outros.awk -f ..\awk\ajusta_codigo_cli_for.awk -v Arquivo="clientes" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\clientes.csv 
awk95 -f ..\awk\codigo_outros.awk -f ..\awk\ajusta_codigo_cli_for.awk -v Arquivo="fornecedores" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\fornecedores.csv

echo    ConversÆo de dados conclu¡da! Pressione qualquer tecla para sair...
pause > nul