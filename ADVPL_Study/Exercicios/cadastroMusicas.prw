#include 'totvs.ch'

/*
    Realiza cadastro de musicas    
*/
User Function CadZZA()
    Local cAlias := "ZZA", cTitulo := "Cadastro de musicas"
    Local cVldExc := ".T.", cVldAlt := ".T." // Validação para Exclusão e Validação para Alteração

    AxCadastro(cAlias, cTitulo, cVldExc, cVldAlt)

Return
