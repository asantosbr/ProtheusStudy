#include 'totvs.ch'

User Function Banco()
    Local aArea := SB1 -> (GetArea()) // faz referência à tabela a ser acessada
    // Local cCod := '000002' // Código do produto (coluna B1_COD)
    Local cCod := FWInputBox('Digite o codigo do produto') // Código do produto (coluna B1_COD)

    DBSelectArea('SB1') // Abre a tabela
    SB1 -> (DBSetOrder(1)) // Localiza o índice
    SB1 -> (DBGoTop()) // Posiciona a tabela corrente no primeiro registro lógico.

    // Busca pelo código do produto (coluna B1_COD)
    If SB1 -> (DBSeek(FWXFilial('SB1') + cCod)) // DBSeek Localiza um registro com determinado valor da expressão de chave de índice. FWXFilial é a filial atual.
        Alert(SB1 -> B1_COD + " " + B1_DESC) // B1_DESC é nome do campo da tabela de produtos
    Else
        Alert('Nao ha produto com o codigo informado.')
    EndIf

    RestArea(aArea) // FECHA TABELA

Return
