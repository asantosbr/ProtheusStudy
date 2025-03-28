#include 'protheus.ch'

User Function Vetor()
    // Local dData := Date()
    // Local aValores := {"Alexander", dData, 100}
    Local nCont

    // Alert(aValores[2])
    // Alert(aValores[3])

    Local aVetor := {10, 20, 30}
    // Alert(Len(aVetor))

    Aadd(aVetor, 40) // adiciona um índice e um elemento (40) ao vetor
    // {10, 20, 30} -> {10, 20, 30, 40}
    // Alert(Len(aVetor))

    Ains(aVetor, 2) // insere um índice na posição 2, desloca os demais índices para a direita e exlui o último índice
    // {10, 20, 30, 40} -> {10, '', 20, 30}

    For nCont := 1 To Len(aVetor)
        // Alert("Indice " + cValToChar(nCont) + ": " + cValToChar(aVetor[nCont]))
    Next nCont

    aVetor[2] := 22
    // {10, '', 20, 30} -> {10, 22, 20, 30}
    
    For nCont := 1 To Len(aVetor)
        // Alert("Indice " + cValToChar(nCont) + ": " + cValToChar(aVetor[nCont]))
    Next nCont
    
    For nCont := 1 To Len(aVetor)
        // Alert("Indice " + cValToChar(nCont) + ": " + cValToChar(aVetor[nCont]))
    Next nCont

    aVetor2 := Aclone(aVetor)
    // Alert(Len(aVetor2))    
    
    For nCont := 1 To Len(aVetor2)
        // Alert("Indice " + cValToChar(nCont) + ": " + cValToChar(aVetor[nCont]))
    Next nCont

    Adel(aVetor, 2) // remove o elemento do índice 2, desloca os elementos da direita para a esquerda e exclui último elemento (o índice permanece)
    // {10, 22, 20, 30} -> {10, 20, 30, ''}

    For nCont := 1 To Len(aVetor)
        // Alert("Indice " + cValToChar(nCont) + ": " + cValToChar(aVetor[nCont]))
    Next nCont

    // Alert(Len(aVetor))
    Aadd(aVetor, 50)
    // {10, 20, 30, ''} -> {10, 20, 30, '', 50}

    For nCont := 1 To Len(aVetor)
        // Alert("Indice " + cValToChar(nCont) + ": " + cValToChar(aVetor[nCont]))
    Next nCont

    Asize(aVetor, 6) // redefine a estrutura do vetor, adicionando ou removendo índice(s)
    // {10, 20, 30, '', 50} -> {10, 20, 30, '', 50, ''}
    Alert(Len(aVetor))
    
    For nCont := 1 To Len(aVetor)
        Alert("Indice " + cValToChar(nCont) + ": " + cValToChar(aVetor[nCont]))
    Next nCont

return
