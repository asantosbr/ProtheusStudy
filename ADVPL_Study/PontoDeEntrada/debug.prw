#include "totvs.ch"

User Function Debug01()
    Local aArea := GetArea(), aProduto := {}, nCount := 0

//  Seleciona a tabela de produtos
    DBSelectArea("SB1")
    //  Seleciona o índice
        SB1 -> (DBSetOrder(1))
    //  Vai para o início da tabela
        SB1 -> (DBGoTop()) // Posiciona o cursor no início da área de trabalho ativa  

    //  Enquanto não for o final do arquivo
        while !SB1 -> (EoF())
            AAdd(aProduto, {SB1 -> B1_COD, SB1 -> B1_DESC})
            nCount ++
            SB1 -> (DBSkip()) // Para retroceder registros: DbSkip(-1)    
        end

        MsgAlert("Quantidade de produtos encontrada: <b>" + cValToChar(nCount) + "</b>.")
        nCount := 0

    RestArea(aArea)
Return
