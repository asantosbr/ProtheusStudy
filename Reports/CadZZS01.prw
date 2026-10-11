#include 'totvs.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} CADZZS01
    Funcao que cadastra as consultas SQL na tabela ZZS    
    @type:  Function
    @author: Alexander Santos
    @since: 05/10/2026
    @version: 1.0.0
    @return: Nil, nao possui retorno
/*/

 User Function CADZZS01()
    Local cTabela := "ZZS"
    Local cTitulo := "Cadastro de Consultas SQL"
    Local cDelOk := ".T."
    Local cUpsert := ".T."

    DBSelectArea(cTabela) // Seleciona a tabela a ser utilizada
    dbSetOrder(1) // Define a ordem de pesquisa da tabela

    AxCadastro(cTabela,cTitulo,cDelOk,cUpsert) // Auxilia na inclusao, exclusao e atualizacao de registros em uma determinada tabela
Return