# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Delete users"

DoggyDate.destroy_all
Message.destroy_all
Match.destroy_all
User.destroy_all


puts "Seeding started"

bob = User.new(email: "seed_user_bob@ymail.com", password: "123456", age: 55, gender: "male", first_name: "Bob", overview: "#{Faker::Creature::Dog.meme_phrase}, #{Faker::Creature::Dog.sound}")
file = URI.open("https://images.unsplash.com/photo-1590074251929-76f7c465a3bd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
bob.photo.attach(io: file, filename: "#{bob.first_name}.jpg", content_type: "image/jpg")
print "Bob... "
betty = User.new(email: "seed_user_betty@ymail.com", password: "654321", age: 44, gender: "female", first_name: "Betty", overview: "#{Faker::Creature::Dog.meme_phrase}, #{Faker::Creature::Dog.sound}")
file = URI.open("https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
betty.photo.attach(io: file, filename: "#{betty.first_name}.jpg", content_type: "image/jpg")
print "Betty... "
george = User.new(email: "seed_user_george@ymail.com", password: "123456", age: 27, gender: "male", first_name: "George", overview: "#{Faker::Creature::Dog.meme_phrase}, #{Faker::Creature::Dog.sound}")
file = URI.open("https://images.unsplash.com/photo-1601912982742-26a940afaa5d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80")
george.photo.attach(io: file, filename: "#{george.first_name}.jpg", content_type: "image/jpg")
print "George... "
talina = User.new(email: "seed_user_talina@ymail.com", password: "123456", age: 30, gender: "female", first_name: "Talina", overview: "#{Faker::Creature::Dog.meme_phrase}, #{Faker::Creature::Dog.sound}")
file = URI.open("https://images.unsplash.com/photo-1564564295391-7f24f26f568b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80")
talina.photo.attach(io: file, filename: "#{talina.first_name}.jpg", content_type: "image/jpg")
print "Talina... "
matt = User.new(email: "seed_user_matthieu@ymail.com", password: "123456", age: 25, gender: "male", first_name: "Matthieu", overview: "#{Faker::Creature::Dog.meme_phrase}, #{Faker::Creature::Dog.sound}")
file = URI.open("https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80")
matt.photo.attach(io: file, filename: "#{matt.first_name}.jpg", content_type: "image/jpg")
puts "Matt... "
if bob.save && betty.save && george.save && talina.save && matt.save
  puts "Created users Bob, Betty, George, Talina, Matt"
else
  puts "ERROR creating Bob, Betty, George, Talina, Matt"
end

cadbury = Dog.new(name: "Cadbury", age: 10, gender: "male", size: "large", breed: "labrador")
cadbury_file = URI.open("https://images.unsplash.com/photo-1610112748593-d3e7dc10b519?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
cadbury.photos.attach(io: cadbury_file, filename: "#{cadbury.name}1.jpg", content_type: "image/jpg")
cadbury_file = URI.open("https://images.unsplash.com/photo-1610112749119-8c17fed117fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
cadbury.photos.attach(io: cadbury_file, filename: "#{cadbury.name}2.jpg", content_type: "image/jpg")
cadbury.user = bob
print "Cadbury... "
fluff = Dog.new(name: "Fluff", age: 7, gender: "female", size: "small", breed: "pomeranian")
fluff_file = URI.open("https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
fluff.photos.attach(io: fluff_file, filename: "#{fluff.name}1.jpg", content_type: "image/jpg")
fluff_file = URI.open("https://images.unsplash.com/photo-1592028616810-88480a45e406?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
fluff.photos.attach(io: fluff_file, filename: "#{fluff.name}2.jpg", content_type: "image/jpg")
fluff.user = betty
print "Fluff... "
fuzz = Dog.new(name: "Fuzz", age: 5, gender: "male", size: "small", breed: "pomeranian")
fuzz_file = URI.open("https://images.unsplash.com/photo-1626975883497-9a84c31be1a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80")
fuzz.photos.attach(io: fuzz_file, filename: "#{fuzz.name}1.jpg", content_type: "image/jpg")
fuzz_file = URI.open("https://images.unsplash.com/photo-1608819368353-02e726da668d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80")
fuzz.photos.attach(io: fuzz_file, filename: "#{fuzz.name}2.jpg", content_type: "image/jpg")
fuzz.user = betty
print "Fuzz... "
egg = Dog.new(name: "Egg", age: 6, gender: "male", size: "tiny", breed: "pug")
egg_file = URI.open("https://images.unsplash.com/photo-1453227588063-bb302b62f50b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
egg.photos.attach(io: egg_file, filename: "#{egg.name}1.jpg", content_type: "image/jpg")
egg_file = URI.open("https://images.unsplash.com/photo-1469982866068-278880140412?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
egg.photos.attach(io: egg_file, filename: "#{egg.name}2.jpg", content_type: "image/jpg")
egg.user = george
print "Egg... "
ruby = Dog.new(name: "Ruby", age: 2, gender: "female", size: "large", breed: "saluki")
ruby_file = URI.open("https://images.unsplash.com/photo-1483434748604-140edba26886?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80")
ruby.photos.attach(io: ruby_file, filename: "#{ruby.name}1.jpg", content_type: "image/jpg")
ruby_file = URI.open("https://images.unsplash.com/photo-1649263395648-0ac58cfa8d75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80")
ruby.photos.attach(io: ruby_file, filename: "#{ruby.name}2.jpg", content_type: "image/jpg")
ruby.user = talina
print "Ruby... "
croissant = Dog.new(name: "Croissant", age: 3, gender: "male", size: "horse", breed: "Dogue de Bordeaux")
croissant_file = URI.open("https://images.unsplash.com/photo-1567886932351-19e78e3e56c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80")
croissant.photos.attach(io: croissant_file, filename: "#{croissant.name}1.jpg", content_type: "image/jpg")
croissant_file = URI.open("https://images.unsplash.com/photo-1584128144719-15c684fbcb3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
croissant.photos.attach(io: croissant_file, filename: "#{croissant.name}2.jpg", content_type: "image/jpg")
croissant.user = matt
puts "Croissant... "

if cadbury.save && fluff.save && fuzz.save && egg.save && ruby.save && croissant.save
  puts "Created Bob, Betty, George, Talina, Matt's dogs"
else
  puts "ERROR creating Bob, Betty, George, Talina, Matt's dogs"
end

#-----------------------------------------

puts "Start creating random faker users, dogs & matches"
num = 0
5.times do
  num += 1
  name = Faker::FunnyName.name
  details = {
    email: "#{name.gsub(/\s/, '_')}@ymail.com",
    password: "123456",
    age: rand(21..39),
    gender: ["male", "female"].sample,
    first_name: name,
    overview: "#{Faker::Creature::Dog.meme_phrase}, #{Faker::Creature::Dog.sound}"
  }
  dog_details = {
    name: Faker::Creature::Dog.name,
    age: rand(1..12),
    gender: Faker::Creature::Dog.gender,
    size: ["small", "medium", "large"].sample,
    breed: Faker::Creature::Dog.breed
  }
  user = User.new(details)
  file = URI.open("https://source.unsplash.com/random/?#{user.gender},person")
  user.photo.attach(io: file, filename: "#{user.first_name}.jpg", content_type: "image/jpg")
  puts "ERROR seeding user" unless user.save

  dog = Dog.new(dog_details)
  dog.user = user

  file1 = URI.open("https://source.unsplash.com/random/?#{dog.breed},dog")
  dog.photos.attach(io: file1, filename: "#{dog.name}1.jpg", content_type: "image/jpg")
  file2 = URI.open("https://source.unsplash.com/random/?#{dog.breed},dog")
  dog.photos.attach(io: file2, filename: "#{dog.name}2.jpg", content_type: "image/jpg")

  if dog.save
    if num == 1
      puts "#{num} zoomie zoomed"
    else
      puts "#{num} zoomies zoomed"
    end
  else
    puts "ERROR seeding dog"
  end

  match1 = Match.create(matcher_id: user.id, matchee_id: bob.id) if num.even?
  match2 = Match.create(matcher_id: user.id, matchee_id: betty.id) if num.odd?
  match3 = Match.create(matcher_id: user.id, matchee_id: george.id) if num.even?
  match4 = Match.create(matcher_id: user.id, matchee_id: talina.id) if num.odd?
  match5 = Match.create(matcher_id: user.id, matchee_id: matt.id) if num.even?

  if match1 || match2 || match3 || match4 || match5
    puts "#{num} has matched"
  else
    puts "ERROR matching"
  end
end

puts "Seeding complete"
