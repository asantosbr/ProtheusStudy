#include 'totvs.ch'
#include 'parmtype.ch'

#DEFINE STR_ENTER Chr(13) + Chr(10) // Quebra de linha para string

/*/{Protheus.doc} CADZZS01
    Funcao para consulta generica -- Cria tela de exibicao com pesquisa. Permite copiar celulas e exportar dados para arquivo .XML
    @type:  Function
    @author: Alexander Santos
    @since: 11/10/2026
    @version: 1.0.0
    @return: Descrever retorno
/*/

User Function mSQLM5TR()
    Local cAlias                := GetNextAlias(cQueryZZS, cCondicaoQuery) // Obtem o proximo alias disponivel

    // Variavel Default: Deve ser declarada apos as locais e antes das privates
    Default cQueryZZS           := '' 
    Default cCondicaoQuery      := '' 

    Private cConsulta       := cQueryZZS
    Private cCondicao       := cCondicaoQuery
    Private cQuery          := ''
    Private cPesquisa       := ''
    Private cGroupOrderBy   := ''

    BeginSQL Alias cAlias
        SELECT
             [ZZS].ZZS_CODE
            ,[ZZS].ZZS_TBMAIN
            ,[ZZS].ZZS_CPPESQ
            ,ISNULL(CONVERT(VARCHAR(8000), CONVERT(VARBINARY(8000), [ZZS].ZZS_QUERY)), '')  AS 'ZZS_QUERY'
            ,ISNULL(CONVERT(VARCHAR(8000), CONVERT(VARBINARY(8000), [ZZS].ZZS_CNDCAO)), '') AS 'ZZS_CNDCAO'
            ,ISNULL(CONVERT(VARCHAR(8000), CONVERT(VARBINARY(8000), [ZZS].ZZS_ORDER)), '')  AS 'ZZS_ORDER'
        FROM %table:ZZS% [ZZS] // %table:nomeTabela% é a Funcao xFilial, retorna a filial do sistema
        WHERE
                D_E_L_E_T_ = ' '
            AND [ZZS].ZZS_CODE = %Exp:cConsulta%
    EndSQL

    cQuery          := (cAlias)->ZZS_QUERY
    cQuery          += STR_ENTER 
    cQuery          += cCondicao
    cPesquisa       := (cAlias)->ZZS_CPPESQ
    cGroupOrderBy   := (cAlias)->ZZS_ORDER

    (cAlias)->(DbCloseArea()) // Fecha a conexao com o alias (Tabela utilizada na consulta)

    MnTTela(cQuery, cPesquisa, cGroupOrderBy) // Chama a funcao que cria a tela de exibicao da consulta

Return

Static Function MnTTela(cQuery, cPesquisa, cGroupOrderBy)


Return