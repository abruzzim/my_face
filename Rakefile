require "sinatra"
require "active_record"
require "sinatra/activerecord"
require "sinatra/activerecord/rake"

require_relative "config/database"

require_relative 'models/person'
require_relative 'models/dog'
require_relative 'models/toy'

namespace :db do
  desc "Seed Empty dogs_and_people_db Database"
  task :seed do
    person1 = Person.create(name: "Mario")
    person2 = Person.create(name: "Wendy")
    person3 = Person.create(name: "Rhonda")
    person4 = Person.create(name: "Pasquale")
    person5 = Person.create(name: "Millie")
    dog1 = Dog.create(name: "Maxine", breed: "German Shepherd")
    dog2 = Dog.create(name: "Pudgie", breed: "Poodle")
    dog3 = Dog.create(name: "Rico Suave", breed: "Chihuahua")
    dog4 = Dog.create(name: "Lexie", breed: "Boxer")
    dog5 = Dog.create(name: "Coco", breed: "Border Collie")
    toy1 = Toy.create(name: "Shoe")
    toy2 = Toy.create(name: "Bone")
    toy3 = Toy.create(name: "Doll")
    toy4 = Toy.create(name: "Ball")
    toy5 = Toy.create(name: "Hair Dryer")
    toy6 = Toy.create(name: "Milk Carton")
    toy7 = Toy.create(name: "Fluffy")
    toy8 = Toy.create(name: "Laptop")
  end
end
