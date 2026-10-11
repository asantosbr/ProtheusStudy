#include "totvs.ch"

/*
    Realiza cadastro de album    
*/
User Function CadZZB()
    Local cAlias := "ZZB", cTitulo := "Cadastro de albuns"
    Local cVldExc := ".T.", cVldAlt := ".T." // Validacao para Exclusao e Validacao para Alteracao

    AxCadastro(cAlias, cTitulo, cVldExc, cVldAlt)
    
Return
