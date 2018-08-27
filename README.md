
# Projeto CataEvento 
![Cataevento](https://raw.githubusercontent.com/felipesousafs/projetoEventos/production/app/assets/images/cataevento.png)
> ##### Projeto final da disciplina Programação Corporativa - ADS - IFPI

## Membros da equipe
 - Edson Borges
 - [Felipe Sousa](github.com/felipesousafs)
 - Paulo Roberto
 - Rubens
 

## Informações úteis:

 - **Linguagem:** Ruby 2.4.4
 - **Framework:** Rails 5.1
 - **IDE *sugerida*:** RubyMine (Jetbrains) - Possui licenças para estudantes e professores
 - **Database:** PostgreSQL
 - **TUTORIAL Ruby:** [TutorialsPoint.com](https://www.tutorialspoint.com/ruby/)
 - **TUTORIAL Ruby on Rails:** [TutorialsPoint.com](https://www.tutorialspoint.com//ruby-on-rails/index.htm) e [Guide Ruby on Rails](https://guides.rubyonrails.org)
 - [Trello do projeto](https://trello.com/b/rjVxzhQO/projeto-final)
 

## Passos para rodar o projeto localmente
 - Preparação do ambiente (instalação do Ruby + Rails): [GoRails.com](https://gorails.com/setup/) (Instale o banco **PostgreSQL** em vez do MySQL)
 - Clonar o projeto do presente repositório
 - Checkout do branch **production**
 - Abrir o terminal no diretório do projeto e executar o comando <code>bundle</code> para que sejam instaladas todas as dependências do projeto
 - Renomear o arquivo **database.exemplo.yml** (dentro da pasta /config) para **database.yml** e adicione seu *usuário* e *senha* do PostgreSQL
 - No terminal, dentro do diretório do projeto, execute os comandos para criação e migração do banco: <code>rails db:create && rails db:migrate</code>
 - Finalmente, execute o seguinte comando para "startar" o servidor: <code>rails server</code> (Ou simplesmente <code>rails s</code>)
 - Acesse o sistema pelo endereço [localhost:3000](localhost:3000)