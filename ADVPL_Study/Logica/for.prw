#include 'protheus.ch'

User Function EstRep()
    Local nCont
    Local nNum := 0

    For nCont := 0 To 10 // Step 2 -> incrementa de 2 em 2
        nNum += nCont

    Next // Fechamento do For
        Alert("Valor de nNum: " + cValToChar(nNum) + ".")

Return
