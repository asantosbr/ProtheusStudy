#include "totvs.ch"

/*
    Realiza cadastro de album    
*/
User Function CadZZB()
    Local cAlias := "ZZB", cTitulo := "Cadastro de albuns"
    Local cVldExc := ".T.", cVldAlt := ".T." // Validação para Exclusão e Validação para Alteração

    AxCadastro(cAlias, cTitulo, cVldExc, cVldAlt)
    
Return
