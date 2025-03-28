#include "TOTVS.ch"
 
User Function aadd2()
  Local aExemplo := {}
  Local cMensagem := ""
  Local nI, nL
  Local aMatriz := {}, aVetor := {"Alexander", "Santos", 42}
    
  //+----------------------------------------------------------------------------+
  //|Exemplifica o uso da função AAdd                                            |
  //+----------------------------------------------------------------------------+
    
  //Adicionando elementos na matriz
    AAdd( aExemplo, {"Arthur",   23} )
    AAdd( aExemplo, {"Bruno",    29} )
    AAdd( aExemplo, {"Douglas",  12} )
    AAdd( aExemplo, {"Fabiana",  25} )
    AAdd( aExemplo, {"José",     38} )
    AAdd( aExemplo, {"Katarina", 42} )
    AAdd( aExemplo, {"Mr. White",    81} )
    AAdd( aExemplo, {"Zoraide",  60} )
  
    cMensagem += cValToChar(aExemplo[1][1])+" tem " + cValToChar( aExemplo[1][2]) +" anos." + CRLF //CRLF PARA QUEBRA DE LINHA
    cMensagem += cValToChar(aExemplo[2][1])+" tem " + cValToChar( aExemplo[2][2]) +" anos." + CRLF
    cMensagem += cValToChar(aExemplo[3][1])+" tem " + cValToChar( aExemplo[3][2]) +" anos." + CRLF
    cMensagem += cValToChar(aExemplo[4][1])+" tem " + cValToChar( aExemplo[4][2]) +" anos." + CRLF
    cMensagem += cValToChar(aExemplo[5][1])+" tem " + cValToChar( aExemplo[5][2]) +" anos." + CRLF
    cMensagem += cValToChar(aExemplo[6][1])+" tem " + cValToChar( aExemplo[6][2]) +" anos." + CRLF
    cMensagem += cValToChar(aExemplo[7][1])+" tem " + cValToChar( aExemplo[7][2]) +" anos." + CRLF
    cMensagem += cValToChar(aExemplo[8][1])+" tem " + cValToChar( aExemplo[8][2]) +" anos." + CRLF

    AAdd(aMatriz, {aVetor[1], aVetor[2], aVetor[3]})
    AAdd(aMatriz, {'Heloisa', 'Santos', 9})

    MsgAlert(Len(aMatriz)) // quantidade de linhas da matriz
    MsgAlert(Len(aMatriz[1])) // quantidade de elementos do índice 1 da matriz

    For nI := 1 To Len(aMatriz)
        For nL := 1 To Len(aMatriz[nI])
            MsgAlert(aMatriz[nI][nL], 'Valores da matriz')
        Next
    Next
  
  //+----------------------------------------------------------------------------+
  //|Apresenta uma mensagem com os resultados obtidos                            |
  //+----------------------------------------------------------------------------+
Return MsgInfo(cMensagem, "Exemplo do AAdd")
