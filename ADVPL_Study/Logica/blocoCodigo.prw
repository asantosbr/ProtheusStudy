#include 'TOTVS.ch'

User Function Somatst2()
    Local bBloco1, x

    bBloco1 := {|n1, n2| Alert("N1 = " + cValToChar(n1)), Alert("N2 = " + cValToChar(n2)), abs(n1) + abs(n2)} // Retorna o valor absoluto. O valor será um número positivo ou zero.
    x := Eval(bBloco1, 20, -10) // chama o bloco de codigo bBloco1
    
    Alert("Resultado: " + cValToChar(x))

Return
