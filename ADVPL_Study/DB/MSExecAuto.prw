#include 'totvs.ch'

User Function execauto1()
    Local aArea := GetArea(), aDados := {}
    Private lMSErroAuto := .f. // sempre inicie como false, pois se houver algum erro ela será alterada para true

    // ; pula linha | Nil: não especificado
    aDados := {;
                {'B1_COD',     '111111', Nil},;
                {'B1_DESC',    'PRODUTO TESTE', },;
                {'B1_TIPO',    'GG', Nil},;
                {'B1_UM',      'UN', Nil},;
                {'B1_LOCPAD',  '01', Nil},;
                {'B1_PICM',     0,00, Nil},;
                {'B1_IPI',      0,00, Nil},;
                {'B1_CONTRAT',  'N', Nil},;
                {'B1_LOCALIZ',  'N', Nil};
              }

    Begin Transaction
      // Chama cadastro de produto (3 inclusao, 4 alteracao, 5 exclusao)
      MSExecAuto({|x, y| Mata010(x, y)}, aDados, 3) // Mata010 é o programa em execução. User shift + F6 para identificar o programa

      If lMSErroAuto // se for true
        Alert('Houve erro durante a operacao.', 'ATENCAO!')
        MostraErro()
        DisarmTransaction() // desfaz a transação
      Else
        MsgInfo('Operacao realizada com sucesso.', 'Concluido')
      EndIf

    End Transaction

    RestArea(aArea)

Return
