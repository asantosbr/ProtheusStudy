#include 'totvs.ch'

User Function fBrowse()
    Local cAlias := 'SA2', aCores := {}, cFiltra := "A2_FILIAL == '" + XFilial('SA2') + "'" // .And. A2_EST == 'PE'"
    Private cCadastro := "Cadastro MBrowse", aRotina := {}, aIndexSA2 := {}
    Private bFiltraBrw := {|| FilBrowse(cAlias, @aIndexSA2, @cFiltra)}

    AAdd(aRotina, {"Pesquisar"  ,"AxPesqui"     ,0,1})
    AAdd(aRotina, {"Visualizar" ,"AxVisual"     ,0,2})
    AAdd(aRotina, {"Incluir"    ,"U_BInclui"    ,0,3})
    AAdd(aRotina, {"Alterar"    ,"U_BAltera"    ,0,4})
    AAdd(aRotina, {"Excluir"    ,"U_BDeleta"    ,0,5})
    AAdd(aRotina, {"Legenda"    ,"U_BLegenda"   ,0,6})

    AAdd(aCores, {"A2_TIPO == 'F'", "BR_VERDE"}) // Física
    AAdd(aCores, {"A2_TIPO == 'J'", "BR_AMARELO"}) // Jurídica
    AAdd(aCores, {"A2_TIPO == 'X'", "BR_LARANJA"}) // Outros
    AAdd(aCores, {"A2_TIPO == 'R'", "BR_MARROM"}) // Fornecedor Rural
    AAdd(aCores, {"EMPTY(A2_TIPO)", "BR_PRETO"}) // Não classificado

    DBSelectArea(cAlias)
        DBSetOrder(1)
        
        Eval(bFiltraBrw)
        
        DBGoTop()
        MBrowse(6, 1, 22, 75, cAlias,,,,,, aCores) // acessar documentação para entender as ,

        EndFilBrw(cAlias, aIndexSA2)
    
    RestArea(cAlias)

Return

// Todo dado que é registrado no BD do Protheus precisa do registro (chave primária, chamada de R_e_c_n_o). Abaixo, representado por nReg
// nOpc é a opção: 1 = Pesquisar, 2 = Visualizar, 3 = Incluir, 4 = Alterar, 5 = Deletar, 6 = Outras ações
User Function BInclui(cAlias, nReg, nOpc)
    Local nOpcao := 0
    nOpcao := AxInclui(cAlias, nReg, nOpc)
    
    If nOpcao == 1
        MsgInfo("Inclusao efetuada com sucesso.")
    else
        // nOpcao := 0
        Alert("Erro ao incluir.")
    EndIf

Return

User Function BAltera(cAlias, nReg, nOpc)
    Local nOpcao := 0
    nOpcao := AxAltera(cAlias, nReg, nOpc)

    If nOpcao == 1
        MsgInfo("Alteracao realizada com sucesso.")
    Else
        nOpcao := 0
        Alert("Falha ao alterar.")
    EndIf

Return

User Function BDeleta()
    Local nOpcao := 0
    nOpcao := AxDeleta(cAlias, nReg, nOpc)

    If nOpcao == 1
        MsgInfo("Deletado com sucesso.")
    Else
        nOpcao := 0
        Alert("Erro ao deletar.")
    EndIf

Return

User Function BLegenda()
    Local aLegenda := {}
    AAdd(aLegenda, {"BR_VERDE", "Pessoa fisica"})
    AAdd(aLegenda, {"BR_AMARELO", "Pessoa juridica"})
    AAdd(aLegenda, {"BR_LARANJA", "Outros"})
    AAdd(aLegenda, {"BR_MARROM", "Produtor rural"})
    AAdd(aLegenda, {"BR_PRETO", "Nao classificado"})

    BrwLegenda(cCadastro, "Legenda", aLegenda) // Recebe o nome da tela, o título e as opções

Return
