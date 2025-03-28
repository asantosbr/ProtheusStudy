#include 'totvs.ch'
#include "PRTOPDEF.CH" // Necessário para utilizar o Ponto de Entrada

User Function A010TOK()
    Local lExecuta := .T.
    Local cTipo := Iif(!Empty(M -> B1_TIPO), AllTrim(M -> B1_TIPO), "") // Iif( <condição>, <valor_se_verdadeiro>, <valor_se_falso> )
    Local cConta := Iif(!Empty(M -> B1_CONTA), AllTrim(M -> B1_CONTA), "")

    If (cTipo == "PA" .AND. cConta == "001")
    //  Sintaxe: Help(cHelp, nLinha, cTitulo, uPar4, cMensagem, nLinMen, nColMen)
        Help(,, cConta, "Atencao!", "A conta <b>" + cConta + "</b> nao pode estar associada a um produto do tipo <b>" + cTipo + "</b>.", 1, 0, .F. ,,,, .T., {"Verifique os campos <b>Tipo</b> e <b>Cta Contabil</b>."})
        lExecuta := .F. // quando essa variável é F, não executa a inclusão/alteração do produto
    EndIf

Return (lExecuta)
