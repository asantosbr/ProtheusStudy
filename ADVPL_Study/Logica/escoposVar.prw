#INCLUDE 'protheus.ch'

// VARIAVEL STATIC
Static cStat := "V"

User Function Escopo1()
// VARIÁVEIS LOCAIS
    Local nNum1 := 10
    Local nNum2 := 20

// VARIAVEL PRIVATE
    cPri := "Private"

// VARIAVEL Public
    Public __cPublic := "Origem" // é boa pratica utilizar __ antes de variaveis publicas para evitar problemas com variaveis do Protheus

    TEscopo(nNum1, @nNum2) // @ referencia a variavel nNum2

    MsgAlert('nNum2: ' + cValToChar(nNum2)) // uma vez que teve seu conteudo alterado pela funçao TEscopo, na variavel valor2, seu valor sera 10

return

Static Function TEscopo(Valor1, valor2)
// ALTERAR CONTEUDO DA VARIAVEL __cPublic    
    Local __cPublic := "Alterada"
    Default nValor1 := 0 // valor default sera 0 ate ser modificado
// ALTERAR CONTEUDO DA VARIAVEL
    valor2 := 10 // o valor da variavel nNum2 será alterado pelo conteudo da valor2, pois a nNum2 foi referenciada ao chamar a funçao

    Alert("cPri: " + cPri)
    Alert("__Public: " + __cPublic)
    Alert("Static: " + cStat)

return
