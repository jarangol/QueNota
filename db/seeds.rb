# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Album.create(name:"A1",year: DateTime.new(2009))
Album.create(name:"All of me",year: DateTime.new(2008))
Album.create(name:"Legends",year: DateTime.new(2008))
Album.create(name:"To you",year: DateTime.new(1960))
Album.create(name:"Rock2",year: DateTime.new(1990))

Genre.create(name:"Salsa")
Genre.create(name:"Merengue")
Genre.create(name:"Porro")
Genre.create(name:"Cumbia")
Genre.create(name:"Rock")
Genre.create(name:"Vallenato")
Genre.create(name:"Pop")


Singer.create(name:"Juanes")
Singer.create(name:"Carlos Vives")
Singer.create(name:"Ed Sheeran")
Singer.create(name:"Shakira")
Singer.create(name:"Maluma")
Singer.create(name:"Justin")
Singer.create(name:"AC/DC")
Singer.create(name:"Aerosmith")
Singer.create(name:"Guns n' Roses")
Singer.create(name:"Julio Jaramillo")
Singer.create(name:"Los Tigres")
