@echo off

REM --> ESTE UTILITARIO VAI TROCAR A ESTENSAO .TXT PARA .CSV; ALEM DISSO IRA TIRAR TODOS OS PONTOS E VIRGULAR E SUBSTITUIR PARA VIRGULA. E DEPOIS VAI TIRAR O PIPE E TROCAR PELO PONTO E VIRGULA
if exist ..\dados\*.txt (
echo. Substituindo ";" para ",". E susbtituindo "|" para ";"
awk95 -f ..\awk\troca_extensao_arquivo.awk
) else ( echo. Nao existe arquivos na pasta dados )

echo.

pause