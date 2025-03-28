#include 'protheus.ch'

User Function DoCase()
    Local cData := "17/02/2025"

    Do Case
        Case cData == "20/12/2025"
            MsgAlert(cData + " nao e natal.")

        Case cData == "25/12/2025"
            MsgAlert('Hoje e natal!')

        OtherWise
            MsgAlert('Nao sei que dia e hoje.')
    EndCase

Return
