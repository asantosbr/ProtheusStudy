#include 'totvs.ch'
#include 'TopConn.ch'

User Function Consulta1()
    Local aArea := SB1 -> (GetArea()), cQuery := '', aDados := {}

    cQuery := " SELECT "
    cQuery += " B1_COD AS CODIGO, B1_DESC AS DESCRICAO "
    cQuery += " FROM "
    cQuery += " " + RetSQLName("SB1") + " SB1 " // RetSQLName Retorna o nome padrão da tabela para select no banco de dados através da query. Sintaxe: RetSqlName(cAlias)
    cQuery += " WHERE"
    cQuery += " B1_MSBLQL != '1' "

    // EXECUTAR A CONSULTA
    // TCQuery executa uma Query no servidor e coloca seu retorno em uma Work Area.
    // A Work Area criada com o comando TCQUERY é READ-ONLY, portanto não é permitido o uso de APPEND's ou REPLACE's.
    TCQuery cQuery New Alias "TMP" // armazena o resultado da query em Work Area temporário. necessário utilizar a biblioteca TopConn.ch
    
    While ! TMP -> (EoF()) // Informa se está no fim do Arquivo/Tabela.
        // AAdd(aDados, TMP -> CODIGO)
        // AAdd(aDados, TMP -> DESCRICAO)
        AAdd(aDados, {TMP -> CODIGO, TMP -> DESCRICAO})
        TMP -> (DBSkip()) // sai da work area temporária
    EndDo

    MsgInfo(cValToChar(Len(aDados)))

    For nL := 1 To Len(aDados)
        cLinha := "" // Inicializa a string da linha

        For nC := 1 To Len(aDados[1])
            cLinha += aDados[nL][nC] + " " // Concatena os valores com um espaço
        Next nC

        MsgInfo(cLinha, 'Codigo  Descricao') // Exibe a linha completa

    Next nL

    TMP -> (DBCloseArea()) // fecha a work area
    RestArea(aArea) // fecha a tabela
    
Return
