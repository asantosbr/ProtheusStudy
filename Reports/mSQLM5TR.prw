#include 'totvs.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

// Quebra de linha para string
#DEFINE STR_ENTER Chr(13)+Chr(10)

/*/{Protheus.doc} CADZZS01
    Funcao para consulta generica -- Cria tela de exibicao com pesquisa. Permite copiar celulas e exportar dados para arquivo .XML
    @type:  Function
    @author: Alexander Santos
    @since: 11/10/2026
    @version: 1.0.0
    @return: Descrever retorno
/*/

User Function mSQLM5TR(cQueryZZS, cCondicaoQuery)
    Local cAlias            := GetNextAlias() // Obtem o proximo alias disponivel
// Variavel Default: Deve ser declarada apos as locais e antes das privates
    Default cQueryZZS       := '' 
    Default cCondicaoQuery  := '' 

    Private cConsulta       := cQueryZZS
    Private cCondicao       := cCondicaoQuery
    Private cQuery          := ''
    Private cPesquisa       := ''
    Private cGroupOrderBy   := ''

    BeginSQL Alias cAlias
        SELECT
             ZZS.ZZS_CODE
            ,ZZS.ZZS_TBMAIN
            ,ZZS.ZZS_CPPESQ
            ,ISNULL(CONVERT(VARCHAR(8000), CONVERT(VARBINARY(8000), ZZS.ZZS_QUERY)), '')  AS 'ZZS_QUERY'
            ,ISNULL(CONVERT(VARCHAR(8000), CONVERT(VARBINARY(8000), ZZS.ZZS_CNDCAO)), '') AS 'ZZS_CNDCAO'
            ,ISNULL(CONVERT(VARCHAR(8000), CONVERT(VARBINARY(8000), ZZS.ZZS_ORDER)), '')  AS 'ZZS_ORDER'
        FROM %table:ZZS% ZZS // %table:nomeTabela% é a Funcao xFilial, retorna a filial do sistema
        WHERE
            D_E_L_E_T_ = ' ' AND ZZS.ZZS_CODE = %Exp:cConsulta%
    EndSQL

    cQuery	        := (cAlias)->ZZS_QUERY
	cQuery	        += STR_ENTER
	cQuery 	        += cCondicao
    cPesquisa       := (cAlias)->ZZS_CPPESQ
    cGroupOrderBy   := (cAlias)->ZZS_ORDER

    (cAlias)->(DbCloseArea()) // Fecha a conexao com o alias (Tabela utilizada na consulta)

    MnTTela(cQuery, cPesquisa, cGroupOrderBy) // Chama a funcao que cria a tela de exibicao da consulta

Return

Static Function MnTTela(cQuery, cPesquisa, cGroupOrderBy)
    Local oAreaPesquisa         // Objeto nao precisa declarar
    Local oAreaDados
    Local oAreaAcao
    Local nTamanhoBtn           := 60

    Default cQuery              := ''
    Default cPesquisa           := ''
    Default cGroupOrderBy       := ''

    Private cConsultaSQL        := cQuery
    Private cPesquisaSQL        := cPesquisa
    Private cGroupOrderBySQL    := cGroupOrderBy
//  MSDIALOG
    Private oDialogoTela
    Private nTelaAltura         := 1000
    Private nTelaLargura        := 060
// Pesquisa
    Private oGetPesquisa        := Space(100) // Como sera utilizada na fucao VALID, precisa declarar como private
    Private cGetPesquisa        := Space(100)
// Area dos Dados
    Private oMSNew              // Sera utilizado para receber a classe MsNewGetDados
    Private aCabecalhoAux         := {} // Declaracao de array vazio
    Private aColunassAux          := {}

    DEFINE MSDIALOG oDialogoTela TITLE 'Consulta de Dados - ' + cConsultaSQL FROM 000, 000 TO nTelaAltura, nTelaLargura COLORS 0, 16777215 STYLE DS_MODALFRAME
    oDialogoTela:IEscClose := .F. // Desabilita o fechamento da tela com ESC
    @ 003, 003 GROUP oAreaPesquisa TO 025, (nTelaLargura / 2) -3 PROMPT 'Pesquisar:' OF oDialogoTela COLOR 0, 16777215 PIXEL // O "-3" e para ajustar o tamanho do campo de pesquisa, ja que a largura foi 003 (eixo y)
    @ 010, 006 MSGET oGetPesquisa VAR cGetPesquisa SIZE (nTelaLargura / 2) -12, 010 OF oDialogoTela COLOR 0, 16777215 VALID(ValidarPesquisa()) PIXEL // O "-12" e para ajustar o tamanho do campo de pesquisa

    @ 028, 003 GROUP oAreaDados TO (nTelaAltura / 2) -28, (nTelaLargura) -3 PROMPT 'Dados: ' OF oDialog COLOR 0, 16777215 PIXEL // O "-28" e para ajustar a altura do campo de exibicao, ja que a altura foi 028 (eixo x)
        oMSNew := MsNewGetDados():New(035, 006,;// O ";" serve para quebrar a linha e continuar o codigo na proxima linha
                                     (nTelaAltura / 2) -31,;
                                     (nTelaLargura / 2) -6,;
                                     GD_INSERT + GD_DELETE + GD_UPDATE,;
                                     "AlwaysTrue()",;
                                     ,"", , , ; // cTudoOk, Inici Campos, Alteracao, Congelamento
                                     999,;
                                     , , ,; // Campo Ok, Supre Del, Delete
                                     oDialogoTela,;
                                     aCabecalhoAux,;
                                     aColunassAux
        )
        oMSNew := IActive := .F. // Desabilita a edicao dos dados quando for criado

        PopularDados()

        @ (nTelaAltura / 2) -25, 003 GROUP oAreaAcao TO (nTelaAltura /2) -3, (nTelaLargura /2) -3 PROMPT 'Ações: ' OF oDialogoTela COLOR 0, 16777215 PIXEL
        // Elementos
            @ (nTelaAltura /2) -19, (nTelaLargura /2) - ((nTamanhoBtn * 1) + 06) BUTTON oBtnExportarExcel PROMPT 'Exportar'  SIZE nTamanhoBtn, 013 OF oDialogoTela ACTION (GerarExcel()) PIXEL
            @ (nTelaAltura /2) -19, (nTelaLargura /2) - ((nTamanhoBtn * 2) + 09) BUTTON oBtnLimparTela PROMPT 'Limpar'  SIZE nTamanhoBtn, 013 OF oDialogoTela ACTION (BtReset()) PIXEL
            @ (nTelaAltura /2) -19, (nTelaLargura /2) - ((nTamanhoBtn * 3) + 12) BUTTON oBtnFechar PROMPT 'Fechar'  SIZE nTamanhoBtn, 013 OF oDialogoTela ACTION (BtFechar()) PIXEL

Return


Static Function ValidarPesquisa()

Return


Static Function PopularDados()

Return

Static Function GerarExcel()

Return

Static Function BtReset()

Return

Static Function BtFechar()

Return