<h1 align="center"> IRotas: Encontre sua autoescola </h1>

<h2 align="center"> Descrição </h2>

Aplicação web que oferece uma plataforma para comunicação entre diversas instituições de ensino para direção de veículos automotores (autoescolas) e clientes (alunos).

<h2 align="center"> Requisitos Funcionais da aplicação: </h2>

### CRUD de Usuários:

* Identificação
* Administrador: 0 / 1 (Não/Sim)
* Nome
* E-mail
* Senha
* Telefone
* Data de Nascimento
* Sexo: M / F

### CRUD de Autoescolas:

* Identificação
* Nome
* Descrição
* Endereço: Rua, número e complemento
* Cidade
* Bairro
* Cep
* Telefone
* E-mail
* Senha

### CRUD de Serviços:

* Identificação
* Identificação Autoescola do Serviço
* Nome/Descrição
* Hora de Início
* Hora de Fim
* Valor
* Tipo de Aula: 0 / 1 (Teórica/Prática)

### CRUD de Interessados:

* Identificação
* Identificação do Serviço
* Identificação do Aluno

### CRUD de Avaliações:

* Identificação
* Identificação da Autoescola
* Identificação do Aluno
* Valor da Avaliação: 0 a 5

<h2 align="center"> Instalação Local </h2>

Para executar o projeto localmento você pode utilizar o arquivo .WAR que se encontra na pasta dist e implata-lo pelo gerenciador de aplicações web do servidor web Apache Tomcat, ou baixar todo o projeto, abri-lo e executa-lo na IDE Apache NetBeans versão 15 com o Tomcat adicionado na IDE.

<h2 align="center"> Construído Com </h2>

* HTML
* CSS
* JavaScript
* JAVA
* SQL

<h2 align="center"> Versão das Linguagens e Ferramentas

#### Servidor de base de dados

* SQLite - 3.36.0

#### Servidor Web

* Apache Tomcat - 9.0.65

#### Ferramentas

* IDE Apache NetBeans - 15
* [JDBC Para SQLite](https://github.com/xerial/sqlite-jdbc/releases) - 3.36.0.3

#### Frameworks/Bibliotecas
* Bootstrap - 5.3

<h2 align="center"> Autores/Desenvolvedores </h2>

* **Alex Feitoza Alves**
* **Brian Melinski Bianchini**
* **Erik Faria da Silva**
* **Luan Alejandro Cardoso Vazquez Gil**
