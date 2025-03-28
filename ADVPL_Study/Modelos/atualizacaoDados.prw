#include 'totvs.ch'
/*
    modelo 1: AXCadastro
    modelo 2: Não é muito recomendado usar
*/

User Function CadTela1()
    Local cAlias := 'SB1'
    Local cVldExc := .T., cVldAlt := .T.
    Private cTitulo := 'Cadastro Produtos - Minha tela AXCadastro'

    AXCadastro(cAlias, cTitulo, cVldExc, cVldAlt) // cria uma tela. Os dois últimos parâmetros permitem a exclusão e a alteração da tabela SB1 (produtos) quando for true

Return Nil
