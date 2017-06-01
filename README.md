# IBRAEMA

* Ruby version

  - \>= 2.2.x

* Dependências

  - Rails 5.0.2
  - geckodriver

* Criação do DB

  - rake db:create
  - rake db:migrate

* Comando para rodar os testes

  - rake cucumber

* Comando para rodar a aplicação

  - rails server

* Docker installation instructions

  Before runing the project for the first time make sure you have installed docker and compose (https://www.docker.com/products/docker and https://docs.docker.com/compose/).

  *For Windows installation make sure you have Professional or Enterprise version.

  *To run on Ubuntu without sudo try this topic http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo

  After downloading the project and having the pre-requisites installed do

  docker-compose build

  If build went fine, for running the project do

  docker-compose up

  For running the project and build do

  docker-compose up --build

  To stop the project without erasing the database do

  docker-compose stop

  To erase the project for any database changes about populate

  docker-compose down
