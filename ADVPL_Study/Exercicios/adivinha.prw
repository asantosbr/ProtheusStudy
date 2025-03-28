#include 'totvs.ch'

Static Function cMsg(cP1)
    Local cMensagem := 'Facil - (F): [1 - 10]' + CRLF + 'Medio - (M): [1 - 20]' + CRLF + 'Dificil - (D): [1 - 50]' + CRLF + 'Impossivel - (I): [1 - 100]' + CRLF

    // cMensagem += 'Facil (F): [1 - 10]' + CRLF + 'Medio (M): [1 - 20]' + CRLF + 'Dificil (D): [1 - 50]' + CRLF + 'Impossivel (I): [1 - 100]' + CRLF

Return MsgInfo(cMensagem, 'Niveis do jogo')

User Function Adivinha()
    Local nChute := 0, nTentativas := 0, nRaspadinha := 1 //  O maior número que será gerado menos um.
    Local cNivel := '', cRange := ''

    cMsg(cNivel)

    cNivel := FWInputBox('Escolha o nivel')

    If cNivel = 'facil' .OR. cNivel = 'Facil' .OR. cNivel = 'f' .OR. cNivel = 'F'
        nRaspadinha := Randomize(1, 10)
        cRange := '[1 - 10]'
        MsgInfo('Voce escolheu o nivel Facil: ' + cRange)
        ElseIf cNivel = 'medio' .OR. cNivel = 'Medio' .OR. cNivel = 'm' .OR. cNivel = 'M'
            nRaspadinha := Randomize(1, 20)
             cRange := '[1 - 20]'
             MsgInfo('Voce escolheu o nivel Medio: ' + cRange)
        ElseIf cNivel = 'dificil' .OR. cNivel = 'Dificil' .OR. cNivel = 'd' .OR. cNivel = 'D'
            nRaspadinha := Randomize(1, 50)
             cRange := '[1 - 50]'
             MsgInfo('Voce escolheu o nivel Dificil: ' + cRange)
        ElseIf cNivel = 'impossivel' .OR. cNivel = 'Impossivel' .OR. cNivel = 'i' .OR. cNivel = 'I'
            nRaspadinha := Randomize(1, 100)
             cRange := '[1 - 100]'
             MsgInfo('Voce escolheu o nivel Impossivel: ' + cRange)
    EndIf

    While nRaspadinha != nChute
        nChute := Val(FWInputBox('Digite um numero: ' + cRange, '')) // Val converte uma sequência de caracteres que contêm dígitos em um valor numérico.
        nTentativas += 1
        If (nChute = nRaspadinha) 
            If nTentativas = 1
                MsgInfo('Incrivel, voce acertou de primeira! A raspadinha e <b>' + cValToChar(nRaspadinha) + '</b>!', 'Fim de jogo!')
                Else
                    MsgInfo('Voce acertou! A raspadinha e <b>' + cValToChar(nRaspadinha) + '</b>!', 'Fim de jogo!')
            EndIf
            elseif (nChute > nRaspadinha)
                MsgAlert('Voce errou, escolheu um numero maior.', 'Errou :(')
            elseif (nChute < nRaspadinha)
                MsgAlert('Voce errou, escolheu um numero menor.')                
        EndIf
    EndDo

    MsgInfo('Voce tentou <b>' + cValToChar(nTentativas) + 'x</b> ate acertar.', 'Desempenho')

Return
