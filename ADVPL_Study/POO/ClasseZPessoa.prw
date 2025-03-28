#include 'totvs.ch'

Static Function fCalcularIdade(dNascimento)
    // Local nIdade := Year(Date()) - Year(::dNascimento)
    // If  Month(::dNascimento) > Month(Date()) .Or. ;
    //     Month(::dNascimento) = Month(Date()) .And. Day(::dNascimento) < Day(Date())
    //     nIdade -= 1
    // EndIf
    Local nIdade := DateDiffYear(Date(), dNascimento) // hoje - dNascimento
    
Return nIdade

/*/{Protheus.doc} className
    Primeira Classe AdvPL
/*/

// z porque é customizado
Class ClassZPessoa
// Todos os atributos começam com Data
// ATRIBUTOS
    Data cNome
    Data dNascimento
    Data nIdade

// CONSTRUTOR
    Method New() CONSTRUCTOR

// MÉTODOS
    Method MostrarIdade() // O método deve ser criado fora da classe?
    
EndClass

Method New(cNome, dNascimento) Class ClassZPessoa
// Para chamar um atributo da classe, devem ser utilizados os ::
    ::cNome := cNome
    ::dNascimento := dNascimento
    ::nIdade := fCalcularIdade(dNascimento)

Return Self


Method MostrarIdade() Class ClassZPessoa
    Local cMsg := cValtoChar(::cNome) + " tem " + cValtoChar(::nIdade) + " anos."
    MSGINFO(cMsg, "Idade")  

Return
