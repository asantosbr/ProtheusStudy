#include 'totvs.ch'

/*
    Realiza cadastro de musicas    
*/
User Function CadZZA()
    Local cAlias := "ZZA", cTitulo := "Cadastro de musicas"
    Local cVldExc := ".T.", cVldAlt := ".T." // Validacao para Exclusao e Validacao para Alteracao

    AxCadastro(cAlias, cTitulo, cVldExc, cVldAlt)

Return
