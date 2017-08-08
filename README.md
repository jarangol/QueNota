# QueNota
Aplicación con MVN para tópicos especiales en telemática Universidad EAFIT.

# README

1.Implementación realizada como proyecto de la materia, en los ambientes:

  * Desarrollo:


  * Test:

  * Producción:

2.Especificaciones técnicas:

* Ruby version: 2.4.1
* Rails version: 5.1.2


3.Deployment instructions to Linux Centos 7:

 * source: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-centos-7

 * Teacher's repository: https://github.com/st0263eafit/QueNota

3.1 Conectarse al servidor remotamente (Ejemplo via ssh).

 * Instalaciones previas:
  * rvm:
    * $ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E37D2BAF1CF37B13E2069D6956105BD0E739499BDB
    * $ \curl -sSL https://get.rvm.io | bash

  * Ruby 2.4.1: $ rvm install 2.4.1

  * Rails gem: $ gem install rails -v 5.1.2

  * Javascript runtime:

  * Node:
      sudo yum install nodejs

 * Instalar postgres:

    * Add Epel yum repostory (If you haven't done it):
      $ sudo yum -y install epel-release

    * Install PostgreSQL server and its development libraries:
      $  sudo yum install postgresql-server postgresql-contrib postgresql-devel

    * Create a new PostgreSQL database cluster:
      $  sudo postgresql-setup initdb

    * Change this file:
      $ sudo nano /var/lib/pgsql/data/pg_hba.conf

        # original:

          host    all             all             127.0.0.1/32            ident
          host    all             all             ::1/128                 ident

        # updated:

          host    all             all             127.0.0.1/32            md5
          host    all             all             ::1/128                 md5

    * run postgres:
        * $ sudo systemctl start postgresql
        * $ sudo systemctl enable postgresql

    * Create Database User:

      * $ sudo su - postgres

      * $ createuser -s <pguser>

      * $ psql

      * postgres=# \password <pguser>

      * Enter new passwordS

      * postgres=# \q


    * Database creation:
        $ rake db:create

    * Database initialization
        $ rake db:seed


 * Setup RAILS_ENV and PORT (3000 for dev, 4000 for testing or 5000 for production)
    $ export RAILS_ENV=test
    $ export PORT=4000

 * open PORT on firewalld service:
    $ sudo firewall-cmd --zone=public --add-port=4000/tcp --permanent
    $ sudo firewall-cmd --reload

 * clone de git repo, install and run:

        $ mkdir apps
        $ cd apps
        $ git clone https://github.com/jarangol/QueNota.git
        $ cd QueNota
        $ bundle install
        $ rake db:reset
        $ export RAILS_ENV=test
        $ export PORT=3001
        $ rails server

4 .Making it run permanently:
  * Source : http://tohyongcheng.github.io/learn/ruby%20on%20rails/digitalocean/capistrano/postgresql/2016/01/10/deploying-ror-on-digitalocean.html

  * SETUP Centos 7.1 in production:

  * With Apache Web Server and Passenger.

      $ sudo yum install httpd
      $ sudo systemctl enable httpd
      $ sudo systemctl start httpd

      test in a browser: http://<your_server_ip>

  * Install Yarn (CentOS / Fedora / RHEL):
    Source:https://yarnpkg.com/en/docs/install

    $  sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo

  ## If you do not already have Node.js installed, you should also configure the NodeSource repository:
    * $ curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -

  ## Then you can simply:
    $ sudo yum install yarn OR sudo dnf install yarn


  * Install Phusion Passenger and Nginx:
    * Install Passenger:
      $ gem install passenger
    * Guide to install Nginx:
      $ passenger-install-nginx-module

  * configure the ruby rails app to use passenger
      Source: (https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/apache/oss/el7/deploy_app.html):

    * summary:

      * $clone the repo to /var/www/myapp/QueNota

      * $ cd /var/www/myapp/QueNota

      * $ bundle install --deployment --without development test

    * Configure database.yml and secrets.yml:

      * Generate the key: $ bundle exec rake secret

      ## and put it in:
      * $ nano config/secrets.yml

       production:
        secret_key_base: <the value that you copied from 'rake secret'>

      * $ bundle exec rake assets:precompile db:migrate

      ## add this to /etc/httpd/conf.d/QueNota.conf:

      <VirtualHost *:3001>
          ServerName  <your_server_ip>

          # Tell Apache and Passenger where your app's 'public' directory is
          DocumentRoot /var/www/myapp/QueNota/public

          PassengerRuby /home/user1/.rvm/gems/ruby-2.4.1/wrappers/ruby

          # Relax Apache security settings
          <Directory /var/www/myapp/QueNota/public>
              Allow from all
              Options -MultiViews
              # Uncomment this if you're on Apache >= 2.4:
              #Require all granted
          </Directory>
      </VirtualHost>

      * $ restart httpd

      * $ sudo systemctl restart httpd
