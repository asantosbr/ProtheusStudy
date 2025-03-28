#include 'protheus.ch'

User Function TestMat()
    Local nI, nL
    Local aMatriz := {}, aVetor := {"Alexander", "Santos", 42}

    For nI := 1 To Len(aVetor)
        // MsgAlert(aVetor[nI], 'Valores do vetor')
    Next

    AAdd(aMatriz, {aVetor[1], aVetor[2], aVetor[3]})
    AAdd(aMatriz, {'Heloisa', 'Santos', 9})

    MsgAlert(Len(aMatriz)) // quantidade de linhas da matriz
    MsgAlert(Len(aMatriz[1])) // quantidade de elementos do índice 1 da matriz

    For nI := 1 To Len(aMatriz)
        For nL := 1 To Len(aMatriz[nI])
            MsgAlert(aMatriz[nI][nL], 'Valores da matriz')
        Next
    Next

Return MsgAlert(aMatriz, 'Valores da matriz')
