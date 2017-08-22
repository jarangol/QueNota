# QueNota
Aplicación con MVN para tópicos especiales en telemática Universidad EAFI*

La aplicación va a permitir a los usuarios registrados compartir sus canciones preferidas, cada una clasificada por género, artista y fecha de lanzamiento. Se presenta la posibilidad de puntuar entre 1-5 cada canción publicada para que se permita clasificarlas adicionalmente según la puntuación.

Por la forma del diseño visual y logístico de los permisos, los usuarios que no estén registrados y respectivamente logueados, solo podrán ver el contenido público o los rankings.

Y la puntuación de sus publicaciones también podrá influir en la reputación del usuario.

Los usuarios podrán navegar por la página y las diferentes secciones, clasificaciones o listados. Además podrán buscar y compartir contenido. Todo lo anterior va ligado a la privacidad de las publicaciones, esto significa que pueden ser públicas o privadas, a elección del usuario.


# Desarrollo e Instalación:

1.Implementación realizada como proyecto de la materia, en los ambientes:

  * Desarrollo: la implementacion se llevo a cabo con Ruby on Rails. Utilizando
  la plantilla generada para una aplicación con arquitectura MVC.


  1.1 La base de datos cuenta con los siguientes modelos y relaciones:

    1.1.1 Singer:
      * name: string

    1.1.2 Album:
      * name: string
      * year: date

    1.1.3 Genre:
      * name: string

    1.1.4 Rating
      * rate: integer # calificacion de 0 a 5 para la canción.
      * song_id: integer

    1.1.5 Song:
        * title: string
        * release: date
        * "song_url": string
        * singer_id: integer
        * album_id: integer
        * genre_id: integer
        * privacity: integer (0: public, 1:shared, 2:private)
        * user_id: integer

  1.2 REST ROUTES

      1.2.1 Descripción: Lista de todas las canciones según la privacidad otorgada
                         o permitida por el usuario.
            Método: GET
            URI: /songs
            Representación de datos:
              Datos Response:
                  * Datos HTML: tabla con las canciones consultadas.

      1.2.2 Descripción: Página para crear una nueva canción.
            Método: GET
            URI: /photos/new
            Representación de datos:

              Datos Response:
                  * Datos HTML: Los datos de la nueva canción

     1.2.3 Descripción: Crear una nueva foto.
           Método: POST
           URI: /songs
           Representación de datos:
             Datos Request:
              :title = string con el titulo
              :release = date del lanzamiento (año)
              :song_url = url para escucharla
              :singer_id = id cantante
              :album_id = id album
              :genre_id = id genero
              :privacity = numero de 0-2 para la privacidad.

              Datos Response:
                   * Datos HTML: Formulario para una nueva entrada de canción.

     1.2.4 Descripción: mostrar una cancion especifica.
           Método: GET
           URI: /photos/:id
           Representación de datos:
             Datos Response:
                 * Datos HTML: Los datos de la canción con el id especificado.

     1.2.5 Descripción: editar una canción especifica.
           Método: GET
           URI: /photos/:id/edit
           Representación de datos:
             Datos Response:
                 * Datos HTML: Formulario para editar.   

     1.2.6 Descripción: Actalizar una canción específica.
              Método: PATCH/PUT
              URI: /photos/:id
              Representación de datos:
                Datos Request:
                 :title = string con el titulo
                 :release = date del lanzamiento (año)
                 :song_url = url para escucharla
                 :singer_id = id cantante
                 :album_id = id album
                 :genre_id = id genero
                 :privacity = numero de 0-2 para la privacidad.

                Datos Response:
                    * Datos HTML: Formulario para editar.   

     1.2.7 Descripción: borrar una canción especifica.
           Método: DELETE
           URI: /photos/:id


     1.2.8 Descripción: Iniciar sesion
           Método: GET
           URI: /users/sign_in
           Representación de datos:
             Datos Response:
                 * Datos HTML: Formulario de acceso

     1.2.9 Descripción: Cerrar sesion
           Método: DELETE
           URI: /users/sign_out
           Representación de datos:
             * Datos Request:
                email:
                password:
      1.2.10 Descripción: Cambiar contraseña
            Método: GET
            URI: /users/password/new
            Representación de datos:
              Datos Response:
                  * Datos HTML: Formulario de cabiar la contraseña

      1.2.11 Descripción: Cambiar contraseña
            Método: PATCH
            URI: /users/password
            Representación de datos:
              Datos Request::
                email:
                password:

      1.2.12 Descripción: nuevo usuario
            Método: GET
            URI: /users/sign_up
            Representación de datos:
            Datos Response:
                * Datos HTML: Formulario de registro

      1.2.13 Descripción: Actualizar perfil.
            Método: PATCH/PUT
            URI: /users
            Representación de datos:
               Datos Request:
                email:
                password:

        1.2.14 Descripción: Borrar usuario.
              Método: DELETE
              URI: /users
              Representación de datos:
                 Datos Request:
                  id:

        1.2.15 Descripción: Crear usuario.
              Método: POST
              URI: /users
              Representación de datos:
                 Datos Request:
                  email:
                  contraseña:


        1.2.16 Descripción: consultar perfil.
              Método: GET
              URI: /users/profile
              Representación de datos:
              Datos Response:
                  * Datos HTML: Lista de las canciones del usuario.



  * Test: DCA Located at EAFIT UNIVERSITY. It needs VPN access to the platform.
      The steps that I have followed are in the 4 step o this readme.

      http://10.131.137.238:3000/

  * Producción:
    https://quenotaj.herokuapp.com/

    I have followed this tutorial : https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up
    In which I learnt how to create and deploy a Rails application with Heroku.


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
    * $ \curl -sSL https://ge* rvm.io | bash

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
