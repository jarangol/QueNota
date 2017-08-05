# QueNota
Aplicación con MVN para tópicos especiales en telemática Universidad EAFIT.

# README

1.Implementación realizada como proyecto de la materia, en los ambientes:

+Desarrollo:


+Test:

+Producción:



2.Especificaciones técnicas:

* Ruby version: 2.4.1
* Rails version: 5.1.2

* System dependencies


* Configuration


* Deployment instructions to Linux Centos 7:

source: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-centos-7

Teacher's repository: https://github.com/st0263eafit/rubyArticulosEM

** Conectarse al servidor remotamente (Ejemplo via ssh).

**Instalaciones previas:

*** rvm:

++++user1@test$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E37D2BAF1CF37B13E2069D6956105BD0E739499BDB

++++user1@test$ \curl -sSL https://get.rvm.io | bash

***Ruby 2.4.1:
  user1@test$ rvm install 2.4.1

***Rails gem:
    user1@test$ gem install rails -v 5.1.2

***Javascript runtime:

  #Node:
    sudo yum install nodejs

**Instalar postgres:

#Add Epel yum repostory (If you haven't done it):
  sudo yum -y install epel-release

#Install PostgreSQL server and its development libraries:
  sudo yum install postgresql-server postgresql-contrib postgresql-devel

#Create a new PostgreSQL database cluster:
    sudo postgresql-setup initdb

#Change this file:
    $ sudo nano /var/lib/pgsql/data/pg_hba.conf

  original:

  host    all             all             127.0.0.1/32            ident
  host    all             all             ::1/128                 ident

  updated:

  host    all             all             127.0.0.1/32            md5
  host    all             all             ::1/128                 md5

#run postgres:

user1@test$ sudo systemctl start postgresql
user1@test$ sudo systemctl enable postgresql

#Create Database User:

  user1@test$ sudo su - postgres

  user1@test$ createuser -s <pguser>

  user1@test$ psql

  postgres=# \password <pguser>
  Enter new passwordS
  postgres=# \q


** Database creation:
  ** Whithout seed data:
    $ rake db:create

  * Database initialization
    $ rake db:seed


**Setup RAILS_ENV and PORT (3000 for dev, 4000 for testing or 5000 for production)
user1@test$ export RAILS_ENV=test
user1@test$ export PORT=4000

**open PORT on firewalld service:
    user1@test$ sudo firewall-cmd --zone=public --add-port=4000/tcp --permanent
    user1@test$ sudo firewall-cmd --reload
