#include 'totvs.ch'

User Function Indice()
    Local aArea := SB1 -> (GetArea()), cMsg := ''
    Local cCodProduto := '000001'

    DBSelectArea('SB1')

    SB1 -> (DBSetOrder(1))
    SB1 -> (DBGoTop())

    cMsg := Posicione('SB1', 1, FWXFilial('SB1') + cCodProduto, ; // este ; é para pular linha
                        'B1_DESC') // nome do campo da tabela
    
    MsgInfo('Descricao do produto: ' + cMsg, 'Informacao')

    RestArea(aArea)

Return
