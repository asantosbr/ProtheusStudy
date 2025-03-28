#include 'protheus.ch'

User Function EstRep2()
    Local nNum1 := 1
    Local cNome := "Alexander"

    While nNum1 != 10 .AND. cNome != "Protheus"
        nNum1++
            If (nNum1 == 5)
                cNome := "Protheus"
            EndIf

    EndDo // Fechamento do While
        Alert("Numero: " + cValToChar(nNum1))
        Alert("Nome: " + cNome)

return
