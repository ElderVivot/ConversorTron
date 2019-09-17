@echo off
title Conversor Tron - Windows
set marcador=   ¯ 

if exist ..\temp\*.* del /q ..\temp\*.*
if exist ..\temp\reconversao\*.* del /q ..\temp\reconversao\*.*
if exist ..\prontos\*.* del /q ..\prontos\*.*
if exist ..\prontos\reconversao\*.* del /q ..\prontos\reconversao\*.*

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

echo.
echo    Iniciando a conversÆo de dados...

REM echo.

REM set /P ComplementoConversao=Eh um complemento de conversao [S/N] ? 

REM if %ComplementoConversao% == s ( set ComplementoConversao=S )

REM if %ComplementoConversao% == S (
REM echo.
REM set /P DataConversao=Digite a data em que pegou os dados da conversao anterior. Formato dd/mm/aaaa: 
REM goto conversao
REM ) else (
REM set DataConversao=01/01/1900
REM goto conversao	
REM )

REM :conversao

echo.
set /P CodigoSeqAlfabetica=Deseja gerar um novo codigo sequencial em ordem alfabetica para as empresas [S/N] ? 

echo.

REM --> E-SOCIAL
echo %marcador%Convertendo eSocial
awk95 -f ..\awk\funcoes.awk -f ..\awk\esocial_organiza.awk ..\dados\esocial.csv > ..\temp\esocial.csv

REM --> EMPRESAS
echo %marcador%Convertendo empresas, filiais, foservicos e fovigencias_servicos
awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_municipio.awk -f ..\awk\codigo_outros.awk -f ..\awk\empresas_geral.awk ..\dados\empresas_geral.csv > ..\temp\empresas_geral.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\empresas_folha.awk ..\dados\empresas_folha.csv > ..\temp\empresas_folha.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\empresas_detalhe.awk ..\dados\empresas_detalhe.csv  > ..\temp\empresas_detalhe.csv

REM --> OS COMANDOS ABAIXO ORGANIZAM OS ARQUIVOS DE EMPRESA ACIMA NUM SÓ
awk95 -f ..\awk\une_emp_geral_com_detalhe.awk ..\temp\empresas_geral.csv ..\temp\empresas_detalhe.csv > ..\temp\empresas_geral_com_detalhe.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\une_emp_folha_com_empresa.awk ..\temp\empresas_folha.csv ..\temp\empresas_geral_com_detalhe.csv > ..\temp\empresas.csv

REM --> RESPONSÁVEIS DA EMPRESA
awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_municipio.awk -f ..\awk\responsaveis.awk ..\dados\responsaveis.csv > ..\temp\responsaveis.csv

REM --> UNE RESPONSÁVEIS COM AS EMPRESAS **** FICAR ATENTO POIS IRÁ GERAR QTD CAMPOS NULOS AUTOMATICAMENTE DE ACORDO NÚMERO DE CAMPOS DO RESPONSAVEIS.AWK SE ACASO NÃO TIVER RESPONSÁVEL PARA EMPRESA
awk95 -f ..\awk\une_emp_com_responsaveis.awk ..\temp\responsaveis.csv ..\temp\empresas.csv > ..\temp\empresas02.csv

REM --> VAI GERAR O REGISTRO DE EMPRESAS, FILIAIS, FOSERVICOS E FOVIGENCIAS_SERVICOS
awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_outros.awk -f ..\awk\chave_outros_x_esocial.awk -f ..\awk\organiza_emp_fil_ser.awk ..\temp\empresas02.csv > ..\temp\empresas03.csv

REM --> SERVICOS RESTANTES QUE NAO FORAM GERADOS NO AWK ANTERIOR
echo %marcador%Convertendo os foservicos e fovigencias_servicos restantes
if exist ..\dados\servicos.csv awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_municipio.awk -f ..\awk\codigo_outros.awk -f ..\awk\chave_outros_x_esocial.awk -f ..\awk\servicos.awk ..\dados\servicos.csv
if not exist ..\temp\foservicos02.csv ( copy /y ..\temp\foservicos.csv ..\temp\foservicos03.csv 
) else awk95 -f ..\awk\une_foservicos.awk ..\temp\foservicos.csv ..\temp\foservicos02.csv > ..\temp\foservicos03.csv
if not exist ..\temp\fovigencias_servico02.csv ( copy /y ..\temp\fovigencias_servico.csv ..\temp\fovigencias_servico03.csv 
) else awk95 -f ..\awk\une_fovigencias_servico.awk ..\temp\fovigencias_servico.csv ..\temp\fovigencias_servico02.csv > ..\temp\fovigencias_servico03.csv

REM --> SÓCIOS
echo %marcador%Convertendo socios
awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_municipio.awk -f ..\awk\socios.awk ..\dados\socios.csv > ..\prontos\1_gesocios.csv

REM --> CONTADORES
echo %marcador%Convertendo contadores
awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_municipio.awk -f ..\awk\contadores.awk ..\dados\contadores.csv > ..\prontos\1_gecontador.csv

REM --> SINDICATOS
echo %marcador%Convertendo sindicatos
awk95 -f ..\awk\funcoes.awk -f ..\awk\sindicatos.awk ..\dados\sindicatos.csv > ..\prontos\2_fosindicatos.csv

REM  --> CARGOS
echo %marcador%Convertendo cargos
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_esocial.awk  -f ..\awk\cargos.awk ..\dados\cargos.csv > ..\temp\cargos.csv

REM --> CENTRO DE CUSTOS
echo %marcador%Convertendo centros de custos
awk95 -f ..\awk\funcoes.awk -f ..\awk\centro_custo.awk ..\dados\ccustos.csv > ..\temp\ccustos.csv

REM --> DEPARTAMENTOS
echo %marcador%Convertendo departamentos
awk95 -f ..\awk\funcoes.awk -f ..\awk\deptos.awk ..\dados\departamentos.csv > ..\temp\deptos.csv

REM --> VAI GERAR UM ARQUIVO BASICO DE FUNCIONARIOS QUE SERVIRA PARA RETIRAR OS CARGOS E JORNADAS CORRETAMENTE
echo %marcador%Gerando arquivo auxiliar de empregados
awk95 -f ..\awk\funcoes.awk -f ..\awk\funcionarios_auxiliar.awk ..\dados\fun_contratuais.csv > ..\temp\funcionarios_auxiliar.csv

REM --> OS COMANDOS ABAIXO VÃO GERAR OS SEGUINTES ARQUIVOS: FOHORARIOS, FOHORARIOS_INTERVALOS, FOJONADAS, FOJORNADAS_HORARIOS
echo %marcador%Convertendo fohorarios, fohorarios_intervalos, fojornadas e fojornadas_horarios
REM --> AS 3 LINHAS ABAIXO VAI UNIR OS ARQUIVOS HORARIOS_INTERVALOS, HORARIOS_SEMANA_INTERVALOS, HORARIOS_SEMANA, HORARIOS_COD_NOME
awk95 -f ..\awk\funcoes.awk -f ..\awk\horarios_semana_com_intervalo.awk ..\dados\horarios_intervalos.csv ..\dados\horarios_semana_intervalo.csv > ..\temp\horarios_semana_com_intervalo.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\horarios_semana.awk  ..\temp\horarios_semana_com_intervalo.csv ..\dados\horarios_semana.csv > ..\temp\horarios_semana.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\horarios_semana_com_nome.awk  ..\dados\horarios_cod_nome.csv ..\temp\horarios_semana.csv > ..\temp\horarios_semana02.csv
REM --> FAZ O FILTRO DOS HORARIOS QUE REALMENTE ESTAO VINCULADOS EM EMPREGADOS OU NAS TROCAS
awk95 -f ..\awk\funcoes.awk -f ..\awk\horarios_somente_necessarios.awk ..\temp\horarios_semana02.csv ..\temp\funcionarios_auxiliar.csv ..\dados\troca_horario.csv > ..\temp\horarios_semana03.csv
sort ..\temp\horarios_semana03.csv > ..\temp\horarios_semana04.csv
REM --> GERA O FOHORARIOS E FOHORARIOS_INTERVALOS
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_esocial.awk -f ..\awk\fohorarios_e_intervalos.awk ..\temp\horarios_semana04.csv
REM --> GERA O FOJORNADAS E FOJORNADAS_HORARIOS
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_outros.awk -f ..\awk\fojornadas_e_horarios.awk ..\temp\horarios_semana04.csv
awk95 -f ..\awk\fojornadas_horarios_sequencial.awk ..\temp\fojornadas_horarios.csv > ..\temp\fojornadas_horarios02.csv

REM --> FUNCIONARIOS
echo %marcador%Convertendo empregados e certidoes civis
awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_municipio.awk -f ..\awk\fun_pessoal.awk ..\dados\fun_pessoal.csv > ..\temp\fun_pessoal.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_fun_x_outros.awk -f ..\awk\fun_dados.awk ..\dados\fun_dados.csv > ..\temp\fun_dados.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_fun_x_outros.awk -f ..\awk\fun_contratuais.awk ..\dados\fun_contratuais.csv > ..\temp\fun_contratuais.csv

REM --> UNE OS 3 ARQUIVOS DE FUNCIONARIOS **** FICAR ATENTO POIS IRÁ GERAR QTD CAMPOS NULOS AUTOMATICAMENTE DE ACORDO NÚMERO DE CAMPOS DO FUN_PESSOAL.AWK E FUN_DADOS.AWK SE ACASO NÃO TIVER ESTAS INFORMACOES 
awk95 -f ..\awk\une_fun_pessoal_com_contratual.awk ..\temp\fun_pessoal.csv ..\temp\fun_contratuais.csv > ..\temp\empregados.csv
awk95 -f ..\awk\une_fun_dados_com_contratual.awk ..\temp\fun_dados.csv ..\temp\empregados.csv > ..\temp\empregados02.csv

REM --> ORGANIZA EMPREGADOS02.CSV PRA GERAR DE ACORDO O LAYOUT FOEMPREGADOS.csv PADRAO E TAMBEM GERAR OS VALORES PADROES
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_esocial.awk -f ..\awk\organiza_fun.awk ..\temp\empregados02.csv > ..\temp\empregados03.csv

REM --> GERA CERTIDOES CIVIS
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_fun.awk -f ..\awk\codigo_municipio.awk -f ..\awk\fun_certidoes_civis.awk ..\dados\fun_certidoes_civis.csv > ..\temp\foempregados_certidao_civil.csv

REM --> DEMITIDOS
echo %marcador%Convertendo demitidos e transferidos
awk95 -f ..\awk\funcoes.awk -f ..\awk\demitidos_fun.awk ..\dados\rescisao.csv > ..\temp\demitidos_fun.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\transferidos_fun.awk ..\dados\transferidos_fun.csv > ..\temp\transferidos_fun.csv

REM --> CONTRIBUINTES
echo %marcador%Convertendo contribuintes
awk95 -f ..\awk\fun_maior_codigo.awk ..\temp\empresas03.csv ..\temp\empregados02.csv > ..\temp\fun_maior_codigo.csv
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_fun_x_outros.awk -f ..\awk\chave_outros_x_esocial.awk -f ..\awk\codigo_municipio.awk -f ..\awk\contribuintes.awk -v data_conversao_orig=%DataConversao% ..\dados\contribuintes.csv > ..\temp\contribuintes.csv

REM --> UNE REGISTRO DE CADASTRO DOS CONTRIBUINTES E EMPREGADOS NUM ARQUIVO SOH PARA SER USADO NA CRIACAO DOS CADASTROS PADROES E DATA_INICIO
echo %marcador%Unindo registro de cadastro dos empregados e contribuintes num arquivo soh para ser usado na criacao dos cadastros padroes e data_inicio
awk95 -f ..\awk\une_dois_arquivos.awk ..\temp\empregados03.csv ..\temp\contribuintes.csv > ..\temp\empregados04.csv

REM --> GERA O CADASTRO PADROES PARA AS EMPRESAS QUE FOREM NECESSARIAS --> VAI ADICIONAR AS INFORMACOES NOS ARQUIVOS CARGOS, DEPTOS, FOHORARIOS02, FOHORARIOS_INTERVALOS, FOJORNADAS02, FOJORNADAS_HORARIOS02
echo %marcador%Gera o cadastro padroes de cargos, departamentos e centro de custo para as empresas que forem necessario
awk95 -f ..\awk\gera_cadastro_padroes.awk ..\temp\empregados04.csv

REM --> DEPENDENTES
echo %marcador%Convertendo dependentes
awk95 -f ..\awk\funcoes.awk -f ..\awk\codigo_municipio.awk -f ..\awk\depen.awk ..\dados\dependentes.csv > ..\temp\dependentes.csv
awk95 -f ..\awk\inclui_empresa_e_fun_no_depen.awk ..\temp\empregados02.csv ..\temp\dependentes.csv > ..\temp\dependentes02.csv
awk95 -f ..\awk\depen_sequencial.awk ..\temp\dependentes02.csv > ..\temp\dependentes03.csv

REM --> IMPLEMENTA DATA DE INICIO DA EMPRESA OU FUNCIONARIO/CONTRIBUINTES MAIS ANTIGO PARA OS ARQUIVOS DE EMPRESAS, FOSERVICOS, FOVIGENCIAS_SERVICOS, CARGOS, DEPARTAMENTOS, FOHORARIOS, FOJONADAS
echo %marcador%Implementando data inicio para empresas, cargos, departamentos ...
awk95 -f ..\awk\data_inicio.awk

REM --> TROCA DE SALARIO
echo %marcador%Convertendo Troca de Salario
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_fun.awk -f ..\awk\troca_salario.awk ..\dados\troca_salario.csv > ..\temp\troca_salario.csv
REM awk95 -f ..\awk\verifica_troca_salario_eh_valido.awk ..\temp\troca_salario.csv > ..\temp\troca_salario02.csv
awk95 -f ..\awk\verifica_troca_salario_permite_menor.awk ..\temp\troca_salario.csv > ..\temp\troca_salario02.csv

REM --> TROCA DE CARGO
echo %marcador%Convertendo Troca de Cargo
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_fun.awk -f ..\awk\chave_fun_x_outros.awk -f ..\awk\troca_cargo.awk ..\dados\troca_cargo.csv > ..\temp\troca_cargo.csv
awk95 -f ..\awk\verifica_troca_cargo_eh_valido.awk ..\temp\troca_cargo.csv > ..\temp\troca_cargo02.csv

REM --> TROCA DE CCUSTOS
echo %marcador%Convertendo Troca de Centro de Custo
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_fun.awk -f ..\awk\chave_fun_x_outros.awk -f ..\awk\troca_ccustos.awk ..\dados\troca_ccustos.csv > ..\temp\troca_ccustos.csv
awk95 -f ..\awk\verifica_troca_ccustos_eh_valido.awk ..\temp\troca_ccustos.csv > ..\temp\troca_ccustos02.csv

REM --> TROCA DE DEPTO
echo %marcador%Convertendo Troca de Departamentos
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_fun.awk -f ..\awk\chave_fun_x_outros.awk -f ..\awk\troca_depto.awk ..\dados\troca_depto.csv > ..\temp\troca_depto.csv
awk95 -f ..\awk\verifica_troca_depto_eh_valido.awk ..\temp\troca_depto.csv > ..\temp\troca_depto02.csv

REM --> TROCA DE JORNADA
echo %marcador%Convertendo Troca de Jornadas
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_fun.awk -f ..\awk\chave_fun_x_outros.awk -f ..\awk\troca_jornada.awk ..\dados\troca_horario.csv > ..\temp\troca_jornada.csv
awk95 -f ..\awk\verifica_troca_jornada_eh_valido.awk ..\temp\troca_jornada.csv > ..\temp\troca_jornada02.csv

REM --> CONTRIBUICAO SINDICAL: TABELAS FOEMPREG_CONTRIB E FOHISTEMPRANT
echo %marcador%Convertendo Contribuicao Sindical
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_fun.awk -f ..\awk\contribuicao_sindical.awk ..\dados\contribuicao_sindical.csv
awk95 -f ..\awk\contribuicao_sindical_sequencial.awk ..\temp\fohistemprant.csv > ..\temp\fohistemprant02.csv

REM --> GOZO DE FERIAS: FOFERIAS_GOZO
echo %marcador%Convertendo Gozo de Ferias
awk95 -f ..\awk\funcoes.awk -f ..\awk\chave_outros_x_fun.awk -f ..\awk\ferias.awk ..\dados\ferias.csv > ..\temp\foferias_gozo.csv
awk95 -f ..\awk\ferias_sequencial.awk ..\temp\foferias_gozo.csv > ..\temp\foferias_gozo02.csv

REM --> UNE AFASTAMENTOS
if not exist ..\temp\demitidos_contribuintes.csv echo ; > ..\temp\demitidos_contribuintes.csv
if not exist ..\temp\transferidos_fun.csv echo ; > ..\temp\transferidos_fun.csv
awk95 -f ..\awk\une_tres_arquivos.awk ..\temp\demitidos_fun.csv ..\temp\demitidos_contribuintes.csv ..\temp\transferidos_fun.csv > ..\temp\demissoes.csv

if %CodigoSeqAlfabetica% == s ( set CodigoSeqAlfabetica=S )

if %CodigoSeqAlfabetica% == S (
awk95 -f ..\awk\empresas_seq_alfabetica.awk ..\temp\empresas04.csv > ..\temp\empresas_seq_alfabetica.csv
sort ..\temp\empresas_seq_alfabetica.csv > ..\temp\empresas_seq_alfabetica02.csv
awk95 -f ..\awk\gera_novo_codigo_seq_alfabetica.awk ..\temp\empresas_seq_alfabetica02.csv > ..\awk\empresas_converter.csv
goto filtroempresa	
) else (
goto filtroempresa	
)

:filtroempresa

REM --> GERA O FILTRO DE EMPRESAS
REM if exist ..\awk\empresas_converter.csv ( awk95 -f ..\awk\funcoes.awk -f ..\awk\filtro_empresa_temp.awk ..\awk\empresas_converter.csv > ..\awk\relacao_empresas.txt
if exist ..\awk\empresas_converter.csv ( awk95 -f ..\awk\funcoes.awk -f ..\awk\filtro_empresa.awk ..\awk\empresas_converter.csv > ..\awk\relacao_empresas.txt
) else awk95 -f ..\awk\funcoes.awk -f ..\awk\filtro_empresa.awk ..\awk\empresas_converter_original.txt > ..\awk\relacao_empresas.txt

echo.
REM --> VINCULA NOVOS CODIGOS SE NECESSARIO
echo %marcador%Filtrando empresas e vinculando novo codigo se informado
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="2_geempre" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\empresas04.csv
if exist ..\temp\foesocial_dados_eventos.csv awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="2_foesocial_dados_eventos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\foesocial_dados_eventos.csv
if exist ..\temp\foesocial_lotes.csv awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="2_foesocial_lotes" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\foesocial_lotes.csv
if exist ..\temp\foesocial_lotes_envios.csv awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="2_foesocial_lotes_envios" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\foesocial_lotes_envios.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="3_fofiliais" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\filiais.csv 
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="3_foservicos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\foservicos04.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="4_fovigencias_servico" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\fovigencias_servico04.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="3_foccustos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\ccustos.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="3_focargos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\cargos02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="3_fodeptos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\deptos02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="3_fohorarios" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\fohorarios02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="4_fohorarios_intervalos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\fohorarios_intervalos.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="3_fojornadas" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\fojornadas02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="5_fojornadas_horarios" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\fojornadas_horarios02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="6_foempregados" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\empregados04.csv
if exist ..\temp\foempregados_dados_eventos_esocial.csv awk95 -f ..\awk\ajusta_codigo_foempregados_esocial.awk -v Arquivo="7_foempregados_dados_eventos_esocial" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\foempregados_dados_eventos_esocial.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="7_fofilhos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\dependentes03.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="8_foafastamentos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\demissoes.csv
REM if exist ..\temp\transferidos_fun.csv awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="transferidos_fun" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\transferidos_fun.csv
REM awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="contribuintes" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\contribuintes.csv
REM if exist ..\temp\demitidos_contribuintes.csv awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="demitidos_contribuintes" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\demitidos_contribuintes.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="9_foaltesal" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\troca_salario02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="9_fotrocas_jornadas" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\troca_jornada02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="9_fotrocas_cargos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\troca_cargo02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="9_fotrocas_depto" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\troca_depto02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="9_fotrocas_ccustos" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\troca_ccustos02.csv
if exist ..\temp\foempreg_contrsind.csv awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="7_foempreg_contrsind" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\foempreg_contrsind.csv
if exist ..\temp\fohistemprant02.csv awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="7_fohistemprant" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\fohistemprant02.csv
awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="7_foferias_gozo" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\foferias_gozo02.csv
if exist ..\temp\foempregados_certidao_civil.csv awk95 -f ..\awk\ajusta_codigo.awk -v Arquivo="7_foempregados_certidao_civil" -v ColunaCodiEmp=1 ..\awk\relacao_empresas.txt ..\temp\foempregados_certidao_civil.csv

REM --> Finalizando ajustes no eSocial, ajustado campo CHAVE_TABELA_DADOS do FOESOCIAL_DADOS_EVENTOS
if exist ..\prontos\2_foesocial_dados_eventos.csv (
echo.
echo %marcador%Finalizando ajustes do eSocial
copy /y ..\prontos\2_foesocial_dados_eventos.csv ..\temp\2_foesocial_dados_eventos.csv > nul
copy /y ..\prontos\2_foesocial_lotes.csv ..\temp\2_foesocial_lotes.csv > nul
copy /y ..\prontos\2_foesocial_lotes_envios.csv ..\temp\2_foesocial_lotes_envios.csv > nul

awk95 -f ..\awk\ajusta_chave_tabela_dados_esocial.awk ..\temp\2_foesocial_dados_eventos.csv > ..\prontos\2_foesocial_dados_eventos.csv
)

REM --> Dos dados gerais retira só aquilo que realmente é necessário
echo %marcador%Retirando dos cadastros gerais soh os que sao utilizados
if exist ..\prontos\2_fobancos.csv copy /y ..\prontos\2_fobancos.csv ..\temp\2_fobancos.csv > nul
if exist ..\prontos\2_fosindicatos.csv copy /y ..\prontos\2_fosindicatos.csv ..\temp\2_fosindicatos.csv > nul
if exist ..\prontos\3_fotabelas.csv copy /y ..\prontos\3_fotabelas.csv ..\temp\3_fotabelas.csv > nul
awk95 -f ..\awk\retirar_dados_gerais_nao_utilizados.awk

REM if %ComplementoConversao% == S (

REM echo.
REM echo %marcador%Ajustando dados para reconversao

REM --> JORNADAS E HORARIOS
REM echo %marcador%Jornadas e Horarios
REM awk95 -f ..\awk\funcoes.awk -f ..\awk\reconversao\compara_arquivos.awk -v arquivo="fojornadas" -v pasta_true=0 -v pasta_false=1 ..\dados\reconversao\fojornadas.csv ..\prontos\fojornadas.csv
REM awk95 -f ..\awk\reconversao\so_fojornadas_horarios_empresa.awk ..\prontos\reconversao\fojornadas.csv ..\prontos\fojornadas_horarios.csv > ..\temp\reconversao\fojornadas_horarios.csv
REM awk95 -f ..\awk\reconversao\so_fohorarios_empresa.awk ..\temp\reconversao\fojornadas_horarios.csv ..\prontos\fohorarios.csv > ..\temp\reconversao\fohorarios.csv
REM awk95 -f ..\awk\reconversao\so_fohorarios_intervalos_empresa.awk ..\temp\reconversao\fohorarios.csv ..\prontos\fohorarios_intervalos.csv > ..\temp\reconversao\fohorarios_intervalos.csv
REM awk95 -f ..\awk\reconversao\insere_novo_cod_horario.awk ..\dados\reconversao\cod_max_horario_por_empresa.csv ..\temp\reconversao\fohorarios.csv ..\temp\reconversao\fojornadas_horarios.csv ..\temp\reconversao\fohorarios_intervalos.csv

REM --> CARGOS
REM echo %marcador%Cargos
REM awk95 -f ..\awk\funcoes.awk -f ..\awk\reconversao\compara_arquivos.awk -v arquivo="cargos" -v pasta_true=0 -v pasta_false=1 ..\dados\reconversao\cargos.csv ..\prontos\cargos.csv

REM --> CENTRO DE CUSTO
REM echo %marcador%Centro de custo
REM awk95 -f ..\awk\funcoes.awk -f ..\awk\reconversao\compara_arquivos.awk -v arquivo="ccustos" -v pasta_true=0 -v pasta_false=1 ..\dados\reconversao\ccustos.csv ..\prontos\ccustos.csv

REM --> DEPARTAMENTOS
REM echo %marcador%Departamento
REM awk95 -f ..\awk\funcoes.awk -f ..\awk\reconversao\compara_arquivos.awk -v arquivo="deptos" -v pasta_true=0 -v pasta_false=1 ..\dados\reconversao\deptos.csv ..\prontos\deptos.csv

REM --> EMPREGADOS
REM echo %marcador%Empregados
REM awk95 -f ..\awk\funcoes.awk -f ..\awk\reconversao\compara_arquivos.awk -v arquivo="empregados" -v pasta_true=0 -v pasta_false=0 ..\dados\reconversao\empregados.csv ..\prontos\empregados.csv
REM awk95 -f ..\awk\reconversao\insere_novo_cod_fun.awk ..\dados\reconversao\cod_max_fun_por_empresa.csv ..\temp\reconversao\empregados_false.csv > ..\prontos\reconversao\empregados.csv

REM --> DEPENDENTES
REM echo %marcador%Dependentes
REM awk95 -f ..\awk\reconversao\dependentes.awk ..\temp\reconversao\empregados_novo_codigo.csv ..\prontos\depen_fun.csv > ..\prontos\reconversao\depen_fun.csv

REM --> DEMITIDOS
REM echo %marcador%Demitidos
REM awk95 -f ..\awk\une_dois_arquivos.awk ..\dados\reconversao\empregados.csv ..\temp\reconversao\empregados_novo_codigo.csv > ..\temp\reconversao\empregados_uniao_codigo.csv
REM awk95 -f ..\awk\reconversao\demitidos.awk ..\temp\reconversao\empregados_uniao_codigo.csv ..\prontos\demitidos_fun.csv > ..\temp\reconversao\demitidos_fun.csv
REM awk95 -f ..\awk\funcoes.awk -f ..\awk\reconversao\compara_arquivos.awk -v arquivo="demitidos_fun" -v pasta_true=0 -v pasta_false=1 ..\dados\reconversao\demitidos_fun.csv ..\temp\reconversao\demitidos_fun.csv

REM --> TROCA DE SALÁRIO
REM echo %marcador%Troca de Salario
REM awk95 -f ..\awk\reconversao\troca_salario.awk -v data_conversao_orig=%DataConversao% ..\temp\reconversao\empregados_uniao_codigo.csv ..\prontos\troca_salario.csv > ..\temp\reconversao\troca_salario.csv
REM awk95 -f ..\awk\funcoes.awk -f ..\awk\reconversao\compara_arquivos.awk -v arquivo="troca_salario" -v pasta_true=0 -v pasta_false=1 ..\dados\reconversao\empregados_possui_calculo.csv ..\temp\reconversao\troca_salario.csv

REM --> TROCA DE CARGO
REM echo %marcador%Troca de Cargo
REM awk95 -f ..\awk\reconversao\troca_cargo.awk -v data_conversao_orig=%DataConversao% ..\temp\reconversao\empregados_uniao_codigo.csv ..\prontos\troca_cargo.csv > ..\temp\reconversao\troca_cargo.csv
REM awk95 -f ..\awk\funcoes.awk -f ..\awk\reconversao\compara_arquivos.awk -v arquivo="troca_cargo" -v pasta_true=0 -v pasta_false=1 ..\dados\reconversao\empregados_possui_calculo.csv ..\temp\reconversao\troca_cargo.csv

REM ) else (
REM goto final	
REM )

REM :final

echo.
echo    ConversÆo de dados conclu¡da! Pressione qualquer tecla para sair...
pause > nul