#include 'protheus.ch'

User Function IfElse(param_name)
    Local nNum1 := 10
    Local nNum2 := 20

    if (nNum1 < nNum2)
        MsgInfo('nNum1 e menor que nNum2.')
    ElseIf (nNum1 > nNum2)
        MsgAlert('nNum1 e maior que nNum2.')
    ElseIf(nNum1 = nNum2)
        MsgInfo('nNum1 e igual a nNum2.')
    else
        MsgInfo('nNum1 nao e igual, nem menor nem maior que nNum2.')
    EndIf

Return
