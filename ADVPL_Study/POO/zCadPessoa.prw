#include "totvs.ch"

User Function zCadPessoa()
    Local oPessoa, cNome := "Alexander Santos", dNascimento := sTod("19820924") // Converte String para Date

// INSTANCIANDO OBJETO
    oPessoa := ClassZPessoa() :New(cNome, dNascimento) // Os mesmos atributos que existem na classe constructor podem ser usados aqui

// CHAMAR MÉTODO DA CLASSE
    oPessoa:MostrarIdade()

Return
