#include 'totvs.ch'

// UTILIZADO PARA ALTERAR (.F.) OU INCLUIR (.T.) NA BASE DE DADOS

User Function Reclock1()
     Local aArea := SB1 -> (GetArea()), codProduto := '000003'
     DBSelectArea('SB1')
        SB1 -> (DBSetOrder(1))
        SB1 -> (DBGoTop())

        Begin Transaction
            MsgInfo('A descricao do produto sera alterada.', 'ATENCAO!')
        
            If SB1 -> (DBSeek(FWxFilial('SB1') + codProduto))
                Reclock('SB1', .F.) // quando passa false para o reclock, o registro é travado para ALTERAÇÃO, true trava para INCLUSÃO
                Replace B1_DESC With 'MONITOR DELL LED 27" 2K'
                SB1 -> (MsUnlock()) // destrava a tabela
            EndIf

            MsgAlert('Alteracao efetuada com sucesso.', 'Concluido')

            // DisarmTransaction() // cancela toda alteração realizada pelo Reclock
        
        End Transaction

    RestArea(aArea)

Return
