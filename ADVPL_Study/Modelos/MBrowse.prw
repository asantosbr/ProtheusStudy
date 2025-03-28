#include 'totvs.ch'

User Function CadTela2()
    Local cAlias := 'SB1'
    Private cCadastro := 'Cadastro Produtos - Minha Tela MBrowse', aRotina := {}

    //        cCadastro (Titulo)   |  Rotina   | 0 é número reservado  | último número é a operação (1 = Pesquisar, 2 = Visualizar, 3 = Incluir, 4 = Alterar, 5 = Deletar, 6 = Outras ações)

    AAdd(aRotina, {'Pesquisar',     "AxPesqui",     0,                       1})
    AAdd(aRotina, {'Visualizar',    "AxVisual",     0, 2})
    AAdd(aRotina, {'Incluir',       "AxInclui",     0, 3})
    AAdd(aRotina, {'Alterar',       "AxAltera",     0, 4})
    AAdd(aRotina, {'Excluir',       "AxDeleta",     0, 5})
    AAdd(aRotina, {'Ola Mundo',     "U_OlaMundo",   0, 6})

    DBSelectArea(cAlias)
        DBSetOrder(1)
        MBrowse(,,,, cAlias) // recebe 5 parâmetros. apenas o último é obrigatório, que é a área. Ex.: MBrowse(,,,,cAlias) ou MBrowse(6, 1, 22, 75, cAlias)

    RestArea(cAlias)

Return Nil
