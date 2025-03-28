#INCLUDE 'protheus.ch'

User Function Variavel()
    Local nNum := 66
    Local lLogic := .T.
    Local cCarac := "Alexander"
    Local dData := Date()
    Local aArray := {"Alexander", "Heloísa", "Santos"}
    Local bBloco := {|| nValor := 2, MsgAlert("O numero e: " + cValToChar(nValor), "")} // || utilizado para inserir parâmetros, mas pode ficar vazio

    Alert(nNum)
    Alert(lLogic)
    Alert(cCarac)
    Alert(aArray[1])
    Eval(bBloco) // chama o bloco de codigo

return
