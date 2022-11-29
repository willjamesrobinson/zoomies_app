# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

puts "Start creating users"
bob = User.new(email: "seed_user_bob@ymail.com", password: "123456", age: 30, gender: "male", first_name: "Bob")
betty = User.new(email: "seed_user_betty@ymail.com", password: "654321", age: 20, gender: "female", first_name: "Betty")
if bob.save && betty.save
  puts "Created users Bob & Betty"
else
  puts "Error seeding user(s)"
end

puts "Start creating dogs"
spot = Dog.new(name: "Spot", age: 2, gender: "male", size: "big", breed: "labrador")
spot.user = bob
fluff = Dog.new(name: "Fluff", age: 7, gender: "female", size: "small", breed: "pomeranian")
fluff.user = betty
fuzz = Dog.new(name: "Fuzz", age: 5, gender: "male", size: "small", breed: "pomeranian")
fuzz.user = betty

if spot.save && fluff.save && fuzz.save
  puts "Created dogs Spot, Fluff & Fuzz"
else
  puts "Error seeding dog(s)"
end
puts "Seeding complete"
