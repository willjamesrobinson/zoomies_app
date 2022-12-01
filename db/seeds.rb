# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Delete matches, users and dogs"

Match.destroy_all
Dog.destroy_all
User.destroy_all

puts "Seeding started"

bob = User.new(email: "seed_user_bob@ymail.com", password: "123456", age: 30, gender: "male", first_name: "Bob")
betty = User.new(email: "seed_user_betty@ymail.com", password: "654321", age: 20, gender: "female", first_name: "Betty")
if bob.save && betty.save
  puts "Created users Bob & Betty"
else
  puts "ERROR creating Bob & Betty"
end

spot = Dog.new(name: "Spot", age: 2, gender: "male", size: "big", breed: "labrador")
spot.user = bob
fluff = Dog.new(name: "Fluff", age: 7, gender: "female", size: "small", breed: "pomeranian")
fluff.user = betty
fuzz = Dog.new(name: "Fuzz", age: 5, gender: "male", size: "small", breed: "pomeranian")
fuzz.user = betty

if spot.save && fluff.save && fuzz.save
  puts "Created Bob & Betty's dogs"
else
  puts "ERROR creating Bob & Betty's dogs"
end

#-----------------------------------------

puts "Start creating faker users & matches"
num = 0
20.times do
  num += 1
  name = Faker::FunnyName.name
  details = {
    email: "#{name.gsub(/\s/, '_')}@ymail.com",
    password: "123456",
    age: 25,
    gender: ["male", "female"].sample,
    first_name: name
  }

  if user = User.create(details)
    if num == 1
      puts "#{num} zoomie zoomed"
    else
      puts "#{num} zoomies zoomed"
    end
  else
    puts "ERROR seeding user"
  end

  match1 = Match.create(matcher_id: user.id, matchee_id: bob.id) if num.even?
  match2 = Match.create(matcher_id: user.id, matchee_id: betty.id) if num.odd?

  if match1 || match2
    puts "#{num} match"
  else
    puts "ERROR matching"
  end
end

puts "Seeding complete"
