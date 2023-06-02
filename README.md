# Aho_Corasick_Delphi
Projeto de implementação do algoritmo de Aho-Corasick em uma aplicação construida em Delphi.

O aplicativo, é uma demonstração de como podemos utilizar o algoritmo de Aho-Corasick para procurar por ocorrências em textos.
Basicamente iremos preencher um Memo com o texto base, e informaremos as palavras chaves a serem buscadas. Em seguida
ao clicarmos no botão de procurar, o código irá instanciar a classe TAhoCorasick(uAhoCorasick.pas).

A instância da classe TAhoCorasick nos habilitará todos os métodos necessários para podermos realizar a busca por padrões no texto base.

Apartir do Objeto instânciado conseguiremos utilizar o método "AddWord" para informar as palavras chaves adicionadas.

Em seguida utilizaremos o método Build para criar a estrutura de de pesquisa do Aho-Corasick, que será responsavel por fazer a varredura 
de todos os caracteres do texto base, identificando os pontos de falha próprios do Aho-Corasick,
e com base nesses pontos de falha irá gerenciar a mudança de estados para prosseguir a busca.

Após será usado o método "FindWords" para jogar as ocorrências encontradas, e suas posições para un Array, que será exibido ao final do programa.

O código pode ser visto em duas partes, sendo elas:

ufrmPrincipal.dfm / ufrmPrincipal.pas -> É o form principal que abriga todos os campos de entrada de dados, e eu seu código faz todas as relações superficiais e de tratamento 
de dados, bem como funcionamento de botões, etc. Na unit principal dentro do botão "Pesquisar" esta o código que é responsável por
utilizar os métodos do AhoCorasick para realizar a busca.

uAhoCorasick.pas -> É a biblioteca que contém a classe TAhoCorasick e TNode, bem como todos os métodos necessários por ela. Desde os Construtures e Destrutures, até os 
métodos que serão utilizados dentro do ufrmPrincipal através da Instância da classe.

Obs: A parte de instância, Objetos e Classe fazem parte de Programação Orientada a Objetos.



