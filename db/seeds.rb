# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Delete messages, matches, users"

DoggyDate.destroy_all
Message.destroy_all
Match.destroy_all
User.destroy_all

puts "Seeding started"
PERSONALITY = ["friendly", "shy", "energetic", "slow", "playful", "rough"]
LOCATION = ["Richmond, Melbourne", "Fitzroy, Melbourne", "Brunswick, Melbourne", "Kew, Melbourne", "Toorak, Melbourne", "Carlton, Melbourne", "Hawthorn, Melbourne", "Brunswick, Melbourne", "Brighton, Melbourne", "Carlton North, Melbourne", "South Yarra, Melbourne", "Collingwood, Melbourne"]

def make_pending_matches(users, admins)
  while users.length.positive?
    this_user = users[0]
    users.each_with_index do |user, index|
      if index.odd?
        Match.create(matcher_id: user.id, matchee_id: this_user.id)
      elsif index.even? && index != 0
        Match.create(matcher_id: this_user.id, matchee_id: user.id)
      end
    end
    admins.each do |admin|
      Match.create(matcher_id: this_user.id, matchee_id: admin.id)
    end
    users.delete(this_user)
  end
end

admin_user_array = []
other_user_array = []
#----------USERS 1-5----------

# Bob
bob = User.new(email: "seed_user_bob@ymail.com", password: "123456", age: 55, gender: "male", first_name: "Bob", overview: "Cadbury is a good boy, he gets along with all dogs. He loves walks and playtime.", address: LOCATION.sample)
file = URI.open("https://images.unsplash.com/photo-1590074251929-76f7c465a3bd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
bob.photo.attach(io: file, filename: "#{bob.first_name}.jpg", content_type: "image/jpg")
print "Bob... "
# Betty
betty = User.new(email: "seed_user_betty@ymail.com", password: "654321", age: 44, gender: "female", first_name: "Betty", overview: "Fluff and Fuzz are my cute little angels who like gentle walks and cuddles. They are looking for some small dog friends.", address: LOCATION.sample)
file = URI.open("https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
betty.photo.attach(io: file, filename: "#{betty.first_name}.jpg", content_type: "image/jpg")
print "Betty... "

# Anja
anja = User.new(email: "seed_user_anja@ymail.com", password: "123456", age: 27, gender: "female", first_name: "Anja", overview: "Egg likes to nap. When he is not napping he would like to meet other dogs to sniff around with in the park.", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/83281237?v=4")
anja.photo.attach(io: file, filename: "#{anja.first_name}.jpg", content_type: "image/jpg")
print "Anja... "
# Talina
talina = User.new(email: "seed_user_talina@ymail.com", password: "123456", age: 25, gender: "female", first_name: "Talina", overview: "Ruby loves to run. We're looking for other fast dogs to run with.", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/79692926?v=4")
talina = User.new(email: "seed_user_talina@ymail.com", password: "123456", age: 30, gender: "female", first_name: "Talina", overview: "Ruby loves to run. We're looking for other fast dogs to run with.", address: LOCATION.sample)
file = URI.open("https://images.unsplash.com/photo-1564564295391-7f24f26f568b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80")
talina.photo.attach(io: file, filename: "#{talina.first_name}.jpg", content_type: "image/jpg")
print "Talina... "
# Matt(hieu)
matt = User.new(email: "seed_user_matthieu@ymail.com", password: "123456", age: 30, gender: "male", first_name: "Matthieu", overview: "Croissant is fierce but loyal. He is looking for other big sturdy dogs to befriend (no lapdogs).", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/62572114?v=4")
matt.photo.attach(io: file, filename: "#{matt.first_name}.jpg", content_type: "image/jpg")
puts "Matt... "

if bob.save && betty.save && anja.save && talina.save && matt.save
  puts "----------Created users Bob, Betty, Anja, Talina, Matt"
  other_user_array.push(bob, betty, anja, talina, matt)
else
  puts "ERROR creating Bob, Betty, Anja, Talina, Matt"
end

#----------USERS 6-10----------

# Ariani
ariani = User.new(email: "seed_user_ariani@ymail.com", password: "123456", age: 28, gender: "female", first_name: "Ariani", overview: "Pocky likes to meet other dogs, especially greyhounds. She can be quiet and also playful.", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/99250831?v=4")
ariani.photo.attach(io: file, filename: "#{ariani.first_name}.jpg", content_type: "image/jpg")
print "Ariani... "
# Will
will = User.new(email: "seed_user_will@ymail.com", password: "123456", age: 25, gender: "male", first_name: "Will", overview: "Louis is friendly and wants to meet other small dogs to walk and play with.", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/104141355?v=4")
will.photo.attach(io: file, filename: "#{will.first_name}.jpg", content_type: "image/jpg")
print "Will... "
# Anna
anna = User.new(email: "seed_user_anna@ymail.com", password: "123456", age: 33, gender: "female", first_name: "Anna", overview: "Archie is friendly and loves to go on walks, he's looking for dogs to walk with.", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/112724681?v=4")
anna.photo.attach(io: file, filename: "#{anna.first_name}.jpg", content_type: "image/jpg")
print "Anna... "
# Lachlan
lachlan = User.new(email: "seed_user_lachlan@ymail.com", password: "123456", age: 25, gender: "male", first_name: "Lachlan", overview: "Elsie is a happy girl, she likes to visit the park.", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/114885131?v=4")
lachlan.photo.attach(io: file, filename: "#{lachlan.first_name}.jpg", content_type: "image/jpg")
print "Lachlan... "
# Kathy
kathy = User.new(email: "seed_user_kathy@ymail.com", password: "123456", age: 32, gender: "female", first_name: "Kathy", overview: "Turnip is a shy little lady but she loves to walk with other dogs once they've become friends!", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/42288986?v=4")
kathy.photo.attach(io: file, filename: "#{kathy.first_name}.jpg", content_type: "image/jpg")
puts "Kathy... "

if ariani.save && will.save && anna.save && lachlan.save && kathy.save
  puts "----------Created users Ariani, Will, Anna, Lachlan & Kathy"
  other_user_array.push(kathy)
  admin_user_array.push(ariani, will, anna, lachlan)
else
  puts "ERROR creating Ariani, Will, Anna, Lachlan & Kathy"
end

#----------USERS 11-15----------

# George
george = User.new(email: "seed_user_george@ymail.com", password: "123456", age: 27, gender: "male", first_name: "George", overview: "Lenny is energetic and friends with everyone he meets.", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/34521157?v=4")
george.photo.attach(io: file, filename: "#{george.first_name}.jpg", content_type: "image/jpg")
print "George... "
# Ben
ben = User.new(email: "seed_user_ben@ymail.com", password: "123456", age: 40, gender: "male", first_name: "Ben", overview: "Salvus is gentle and likes to walk and get pats. We're looking for other calm dogs", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/40282417?v=4")
ben.photo.attach(io: file, filename: "#{ben.first_name}.jpg", content_type: "image/jpg")
print "Ben... "
# Craig
craig = User.new(email: "seed_user_craig@ymail.com", password: "123456", age: 31, gender: "male", first_name: "Craig", overview: "Simba is just a pup but full of personality. He is looking to socialise more and play.", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/108213908?v=4")
craig.photo.attach(io: file, filename: "#{craig.first_name}.jpg", content_type: "image/jpg")
print "Craig... "
# Ryan
ryan = User.new(email: "seed_user_ryan@ymail.com", password: "123456", age: 25, gender: "male", first_name: "Ryan", overview: "Apple is chill and would love to picnic with some dog friends and pizza.", address: LOCATION.sample)
file = URI.open("https://avatars.githubusercontent.com/u/114888159?v=4")
ryan.photo.attach(io: file, filename: "#{ryan.first_name}.jpg", content_type: "image/jpg")
print "Ryan... "
# Geralt
geralt = User.new(email: "seed_user_geralt@ymail.com", password: "123456", age: 39, gender: "male", first_name: "Geralt", overview: "Roach is fierce and looking for other sturdy dogs to play with.", address: LOCATION.sample)
file = URI.open("https://static.wikia.nocookie.net/witcher/images/5/51/Netflix_geralt_shirt.jpg/revision/latest/scale-to-width-down/1000?cb=20191228182240")
geralt.photo.attach(io: file, filename: "#{geralt.first_name}.jpg", content_type: "image/jpg")
puts "Geralt... "

if george.save && ben.save && craig.save && ryan.save && geralt.save
  puts "----------Created users George, Ben, Craig, Ryan & Geralt"
  other_user_array.push(george, ben, craig, ryan, geralt)
else
  puts "ERROR creating George, Ben, Craig, Ryan & Geralt"
end

#----------USERS 16-20----------

# Sabrina
sabrina = User.new(email: "seed_user_sabrina@ymail.com", password: "123456", age: 27, gender: "female", first_name: "Sabrina", overview: "Salem is a chatty boy, he is looking for other dogs to chat with.", address: LOCATION.sample)
file = URI.open("https://static.wikia.nocookie.net/riverdalearchie/images/d/da/CAOS-Sabrina-Spellman.jpg/revision/latest?cb=20220712164528")
sabrina.photo.attach(io: file, filename: "#{sabrina.first_name}.jpg", content_type: "image/jpg")
print "Sabrina... "
# Hermione
hermione = User.new(email: "seed_user_hermione@ymail.com", password: "123456", age: 40, gender: "female", first_name: "Hermione", overview: "Crookshanks is not a people person but she loves other dogs", address: LOCATION.sample)
file = URI.open("https://static.wikia.nocookie.net/harrypotter/images/3/34/Hermione_Granger.jpg/revision/latest/scale-to-width-down/1000?cb=20210522145306")
hermione.photo.attach(io: file, filename: "#{hermione.first_name}.jpg", content_type: "image/jpg")
print "Hermione... "
# Winnie
winnie = User.new(email: "seed_user_winnie@ymail.com", password: "123456", age: 31, gender: "female", first_name: "Winnie", overview: "Pooh loves snacks and walks with other dogs.", address: LOCATION.sample)
file = URI.open("https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80")
winnie.photo.attach(io: file, filename: "#{winnie.first_name}.jpg", content_type: "image/jpg")
print "Winnie... "
# Alexa
alexa = User.new(email: "seed_user_alexa@ymail.com", password: "123456", age: 25, gender: "female", first_name: "Alexa", overview: "Siri is a smart girl, she may even teach your dog tricks.", address: LOCATION.sample)
file = URI.open("https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
alexa.photo.attach(io: file, filename: "#{alexa.first_name}.jpg", content_type: "image/jpg")
print "Alexa... "
# Liz
liz = User.new(email: "seed_user_liz@ymail.com", password: "123456", age: 39, gender: "female", first_name: "Liz", overview: "Queenie loves to be spoiled and is looking for some pampered doggo friends", address: LOCATION.sample)
file = URI.open("https://images.unsplash.com/photo-1568046866815-b19260707681?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
liz.photo.attach(io: file, filename: "#{liz.first_name}.jpg", content_type: "image/jpg")
puts "Liz... "

if sabrina.save && hermione.save && winnie.save && alexa.save && liz.save
  puts "----------Created users Sabrina, Hermione, Winnie, Alexa, Liz"
  other_user_array.push(sabrina, hermione, winnie, alexa, liz)
else
  puts "ERROR creating Sabrina, Hermione, Winnie, Alexa, Liz"
end

#----------DOGS 1-6 (2 for Betty)----------

# Cadbury
cadbury = Dog.new(name: "Cadbury", age: 10, gender: "male", size: "large", breed: "labrador", personality: ["friendly", "energetic", "playful"])

if bob.save && betty.save && talina.save && matt.save
  # && ariani.save
  puts "Created users Bob, Betty, Talina, Matt, Ariani"
else
  puts "ERROR creating Bob, Betty, Talina, Matt, Ariani"
end

cadbury = Dog.new(name: "Cadbury", age: 10, gender: "male", size: "medium", breed: "labrador", personality: ["friendly", "energetic", "playful"])

cadbury_file = URI.open("https://images.unsplash.com/photo-1610112748593-d3e7dc10b519?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
cadbury.photos.attach(io: cadbury_file, filename: "#{cadbury.name}1.jpg", content_type: "image/jpg")
cadbury_file = URI.open("https://images.unsplash.com/photo-1610112749119-8c17fed117fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
cadbury.photos.attach(io: cadbury_file, filename: "#{cadbury.name}2.jpg", content_type: "image/jpg")
cadbury.user = bob
print "Cadbury... "

# Fluff & Fuzz

fluff = Dog.new(name: "Fluff", age: 7, gender: "female", size: "small", breed: "pomeranian", personality: ["friendly", "slow", "playful"])
fluff_file = URI.open("https://images.unsplash.com/photo-1582456891925-a53965520520?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
fluff.photos.attach(io: fluff_file, filename: "#{fluff.name}1.jpg", content_type: "image/jpg")
fluff_file = URI.open("https://images.unsplash.com/photo-1592028616810-88480a45e406?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
fluff.photos.attach(io: fluff_file, filename: "#{fluff.name}2.jpg", content_type: "image/jpg")
fluff.user = betty
print "Fluff... "
fuzz = Dog.new(name: "Fuzz", age: 5, gender: "male", size: "small", breed: "pomeranian", personality: ["shy", "slow", "friendly"])
fuzz_file = URI.open("https://images.unsplash.com/photo-1626975883497-9a84c31be1a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80")
fuzz.photos.attach(io: fuzz_file, filename: "#{fuzz.name}1.jpg", content_type: "image/jpg")
fuzz_file = URI.open("https://images.unsplash.com/photo-1608819368353-02e726da668d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80")
fuzz.photos.attach(io: fuzz_file, filename: "#{fuzz.name}2.jpg", content_type: "image/jpg")
fuzz.user = betty
print "Fuzz... "

# Egg

egg = Dog.new(name: "Egg", age: 6, gender: "male", size: "small", breed: "pug", personality: ["friendly", "slow", "shy"])
egg_file = URI.open("https://images.unsplash.com/photo-1453227588063-bb302b62f50b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
egg.photos.attach(io: egg_file, filename: "#{egg.name}1.jpg", content_type: "image/jpg")
egg_file = URI.open("https://images.unsplash.com/photo-1469982866068-278880140412?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
egg.photos.attach(io: egg_file, filename: "#{egg.name}2.jpg", content_type: "image/jpg")

egg.user = anja
print "Egg... "
# Ruby

ruby = Dog.new(name: "Ruby", age: 2, gender: "female", size: "large", breed: "saluki", personality: ["shy", "energetic", "rough"])
ruby_file = URI.open("https://images.unsplash.com/photo-1483434748604-140edba26886?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1026&q=80")
ruby.photos.attach(io: ruby_file, filename: "#{ruby.name}1.jpg", content_type: "image/jpg")
ruby_file = URI.open("https://images.unsplash.com/photo-1649263395648-0ac58cfa8d75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80")
ruby.photos.attach(io: ruby_file, filename: "#{ruby.name}2.jpg", content_type: "image/jpg")
ruby.user = talina
print "Ruby... "
# Croissant
croissant = Dog.new(name: "Croissant", age: 3, gender: "male", size: "large", breed: "Dogue de Bordeaux", personality: ["shy", "energetic", "rough"])
croissant_file = URI.open("https://images.unsplash.com/photo-1567886932351-19e78e3e56c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80")
croissant.photos.attach(io: croissant_file, filename: "#{croissant.name}1.jpg", content_type: "image/jpg")
croissant_file = URI.open("https://images.unsplash.com/photo-1584128144719-15c684fbcb3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
croissant.photos.attach(io: croissant_file, filename: "#{croissant.name}2.jpg", content_type: "image/jpg")
croissant.user = matt
puts "Croissant... "

if cadbury.save && fluff.save && fuzz.save && egg.save && ruby.save && croissant.save
  puts "Created Bob, Betty, Rob, Talina, Matt & Ariani's dogs"
else
  puts "ERROR creating Bob, Betty, Rob, Talina, Matt & Ariani's dogs"
end

#----------DOGS 7-11----------


# Pocky
pocky = Dog.new(name: "Pocky", age: 3, gender: "female", size: "large", breed: "greyhound", personality: ["friendly", "energetic", "playful"])
pocky_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670475127/bcwyuv9897g2co7hyflh.jpg")
pocky.photos.attach(io: pocky_file, filename: "#{pocky.name}1.jpg", content_type: "image/jpg")
pocky_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670477011/uu2fznsefkfkinqiybwi.jpg")
pocky.photos.attach(io: pocky_file, filename: "#{pocky.name}2.jpg", content_type: "image/jpg")
pocky.user = ariani
print "Pocky... "
# Louis
louis = Dog.new(name: "Louis", age: 1, gender: "male", size: "small", breed: "dachshund", personality: PERSONALITY.sample(3))
louis_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670517511/hvnwkfunxszp81jersvb.jpg")
louis.photos.attach(io: louis_file, filename: "#{louis.name}1.jpg", content_type: "image/jpg")
louis.user = will
print "Louis... "
# Archie
archie = Dog.new(name: "Archie", age: 8, gender: "male", size: "small", breed: "jack russel", personality: PERSONALITY.sample(3))
archie_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670517562/artdklsroje8etaiudqm.jpg")
archie.photos.attach(io: archie_file, filename: "#{archie.name}1.jpg", content_type: "image/jpg")
archie_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670517579/yqym2w7jrofkmb8ipymr.jpg")
archie.photos.attach(io: archie_file, filename: "#{archie.name}2.jpg", content_type: "image/jpg")
archie.user = anna
print "Archie... "
# Elsie
elsie = Dog.new(name: "Elsie", age: 2, gender: "female", size: "small", breed: "golden doodle", personality: PERSONALITY.sample(3))
elsie_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670518097/j3rwe5qlonjmtorkwrpp.jpg")
elsie.photos.attach(io: elsie_file, filename: "#{elsie.name}1.jpg", content_type: "image/jpg")
elsie.user = lachlan
print "Elsie... "
# Turnip
turnip = Dog.new(name: "Turnip", age: 5, gender: "female", size: "small", breed: "jack russel", personality: PERSONALITY.sample(3))
turnip_file = URI.open("https://images.unsplash.com/photo-1494205577727-d32e58564756?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
turnip.photos.attach(io: turnip_file, filename: "#{turnip.name}1.jpg", content_type: "image/jpg")
turnip_file = URI.open("https://images.unsplash.com/photo-1514134136604-e14631dd3477?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
turnip.photos.attach(io: turnip_file, filename: "#{turnip.name}2.jpg", content_type: "image/jpg")
turnip.user = kathy
puts "Turnip... "
if pocky.save && louis.save && archie.save && elsie.save && turnip.save
  puts "----------Created Ariani, Will, Anna, Lachlan & Kathy's dogs"
else
  puts "ERROR creating Ariani, Will, Anna, Lachlan & Kathy's dogs"
end

#----------DOGS 12-16----------

# Lenny
lenny = Dog.new(name: "Lenny", age: 4, gender: "male", size: "large", breed: "farm dog", personality: PERSONALITY.sample(3))
lenny_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670517621/ljvploq4j5x6gk4mznht.jpg")
lenny.photos.attach(io: lenny_file, filename: "#{lenny.name}1.jpg", content_type: "image/jpg")
lenny_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670517641/m7udoq5bau0ahuedzmit.jpg")
lenny.photos.attach(io: lenny_file, filename: "#{lenny.name}2.jpg", content_type: "image/jpg")
lenny.user = george
print "Lenny... "
# Salvus
salvus = Dog.new(name: "Salvus", age: 5, gender: "male", size: "large", breed: "collie", personality: PERSONALITY.sample(3))
salvus_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670517479/tyu3bkrevpxg6zrr3aim.jpg")
salvus.photos.attach(io: salvus_file, filename: "#{salvus.name}1.jpg", content_type: "image/jpg")
salvus.user = ben
print "Salvus... "
# Simba
simba = Dog.new(name: "Simba", age: 0, gender: "male", size: "small", breed: "teddy bear", personality: PERSONALITY.sample(3))
simba_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670519606/kphla9p8j2xsgmhqghtt.jpg")
simba.photos.attach(io: simba_file, filename: "#{simba.name}1.jpg", content_type: "image/jpg")
simba_file = URI.open("https://res.cloudinary.com/dtcaswh8v/image/upload/v1670519630/kgvzre1uh9vnvx9qqwxj.jpg")
simba.photos.attach(io: simba_file, filename: "#{simba.name}2.jpg", content_type: "image/jpg")
simba.user = craig
print "Simba... "
# Apple
apple = Dog.new(name: "Apple", age: 3, gender: "female", size: "medium", breed: "beagle", personality: PERSONALITY.sample(3))
apple_file = URI.open("https://images.unsplash.com/photo-1578678890094-3ddb1146ca99?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80")
apple.photos.attach(io: apple_file, filename: "#{apple.name}1.jpg", content_type: "image/jpg")
apple_file = URI.open("https://images.unsplash.com/photo-1581864727889-c065732c1088?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80")
apple.photos.attach(io: apple_file, filename: "#{apple.name}2.jpg", content_type: "image/jpg")
apple.user = ryan
print "Apple... "
# Roach
roach = Dog.new(name: "Roach", age: 2, gender: "male", size: "medium", breed: "whippet", personality: PERSONALITY.sample(3))
roach_file = URI.open("https://images.unsplash.com/photo-1521231392889-9ec2ec16bd35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
roach.photos.attach(io: roach_file, filename: "#{roach.name}1.jpg", content_type: "image/jpg")
roach_file = URI.open("https://images.unsplash.com/photo-1662317167813-fdc305e87d92?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")
roach.photos.attach(io: roach_file, filename: "#{roach.name}2.jpg", content_type: "image/jpg")
roach.user = geralt
puts "Roach... "
if lenny.save && salvus.save && simba.save && apple.save && roach.save
  puts "----------Created George, Ben, Craig, Ryan & Geralt's dogs"
else
  puts "ERROR creating George, Ben, Craig, Ryan & Geralt's dogs"
end

#----------DOGS 17-21----------

# Salem
salem = Dog.new(name: "Salem", age: 1, gender: "male", size: "medium", breed: "staffy", personality: PERSONALITY.sample(3))
salem_file = URI.open("https://images.unsplash.com/photo-1617617152387-64ca07643e5e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80")
salem.photos.attach(io: salem_file, filename: "#{salem.name}1.jpg", content_type: "image/jpg")
salem_file = URI.open("https://images.unsplash.com/photo-1613946278311-8036153d0189?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
salem.photos.attach(io: salem_file, filename: "#{salem.name}2.jpg", content_type: "image/jpg")
salem.user = sabrina
print "Salem... "
# Crookshanks
crookshanks = Dog.new(name: "Crookshanks", age: 6, gender: "female", size: "small", breed: "maltese", personality: PERSONALITY.sample(3))
crookshanks_file = URI.open("https://images.unsplash.com/photo-1624658289837-9bbdb4991d9c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")
crookshanks.photos.attach(io: crookshanks_file, filename: "#{crookshanks.name}1.jpg", content_type: "image/jpg")
crookshanks_file = URI.open("https://images.unsplash.com/photo-1621496885500-a7c536f6b12f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
crookshanks.photos.attach(io: crookshanks_file, filename: "#{crookshanks.name}2.jpg", content_type: "image/jpg")
crookshanks.user = hermione
print "Crookshanks... "
# Pooh
pooh = Dog.new(name: "Pooh", age: 3, gender: "male", size: "medium", breed: "bulldog", personality: PERSONALITY.sample(3))
pooh_file = URI.open("https://images.unsplash.com/photo-1570314032164-6a08c8fa63d2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
pooh.photos.attach(io: pooh_file, filename: "#{pooh.name}1.jpg", content_type: "image/jpg")
pooh_file = URI.open("https://images.unsplash.com/photo-1546201483-a0fa9e5ed258?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
pooh.photos.attach(io: pooh_file, filename: "#{pooh.name}2.jpg", content_type: "image/jpg")
pooh.user = winnie
print "Pooh... "
# Siri
siri = Dog.new(name: "Siri", age: 1, gender: "female", size: "medium", breed: "poodle", personality: PERSONALITY.sample(3))
siri_file = URI.open("https://images.unsplash.com/photo-1605244863941-3a3ed921c60d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
siri.photos.attach(io: siri_file, filename: "#{siri.name}1.jpg", content_type: "image/jpg")
siri_file = URI.open("https://images.unsplash.com/photo-1555596873-1916fae19257?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1112&q=80")
siri.photos.attach(io: siri_file, filename: "#{siri.name}2.jpg", content_type: "image/jpg")
siri.user = alexa
print "Siri... "
# Queenie
queenie = Dog.new(name: "Queenie", age: 4, gender: "female", size: "medium", breed: "corgi", personality: PERSONALITY.sample(3))
queenie_file = URI.open("https://images.unsplash.com/photo-1519098901909-b1553a1190af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80")
queenie.photos.attach(io: queenie_file, filename: "#{queenie.name}1.jpg", content_type: "image/jpg")
queenie_file = URI.open("https://images.unsplash.com/photo-1597633425046-08f5110420b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
queenie.photos.attach(io: queenie_file, filename: "#{queenie.name}2.jpg", content_type: "image/jpg")
queenie.user = liz
puts "Queenie... "
if salem.save && crookshanks.save && pooh.save && siri.save && queenie.save
  puts "----------Created Sabrina, Hermione, Winnie, Alexa, Liz's dogs"
else
  puts "ERROR creating 'Sabrina, Hermione, Winnie, Alexa, Liz's dogs"
end

#----------MATCHES----------

make_pending_matches(other_user_array, admin_user_array)

if Match.all.empty?
  puts "ERROR matching zoomies"
else
  puts "Zoomies matched!"
end

#----------FAKER EXTRA USERS----------

# puts "Start creating random faker users, dogs & matches"
# num = 0
# 1.times do
#   num += 1
#   name = Faker::FunnyName.name
#   details = {
#     email: "#{name.gsub(/\s/, '_')}@ymail.com",
#     password: "123456",
#     age: rand(21..39),
#     gender: ["male", "female"].sample,
#     first_name: name,
#     overview: "#{Faker::Creature::Dog.meme_phrase}, #{Faker::Creature::Dog.sound}",
#     address: LOCATION.sample
#   }
#   personality_sample = PERSONALITY
#   personality_array = []
#   3.times do
#     personality = personality_sample.sample
#     personality_array << personality
#     personality_sample.delete(personality)
#   end
#   dog_details = {
#     name: Faker::Creature::Dog.name,
#     age: rand(1..12),
#     gender: ["female", "male"].sample,
#     size: ["small", "medium", "large"].sample,
#     breed: Faker::Creature::Dog.breed,
#     personality: personality_array
#   }
#   user = User.new(details)
#   file = URI.open("https://source.unsplash.com/random/?#{user.gender},person")
#   user.photo.attach(io: file, filename: "#{user.first_name}.jpg", content_type: "image/jpg")
#   puts "ERROR seeding user" unless user.save

#   dog = Dog.new(dog_details)
#   dog.user = user

#   file1 = URI.open("https://source.unsplash.com/random/?#{dog.breed},dog")
#   dog.photos.attach(io: file1, filename: "#{dog.name}1.jpg", content_type: "image/jpg")
#   file2 = URI.open("https://source.unsplash.com/random/?#{dog.breed},dog")
#   dog.photos.attach(io: file2, filename: "#{dog.name}2.jpg", content_type: "image/jpg")

#   if dog.save
#     if num == 1
#       puts "#{num} zoomie zoomed"
#     else
#       puts "#{num} zoomies zoomed"
#     end
#   else
#     puts "ERROR seeding dog"
#   end

#   match1 = Match.create(matcher_id: user.id, matchee_id: bob.id) if num.even?
#   match2 = Match.create(matcher_id: user.id, matchee_id: betty.id) if num.odd?
#   match3 = Match.create(matcher_id: user.id, matchee_id: anja.id) if num.even?
#   match4 = Match.create(matcher_id: user.id, matchee_id: talina.id) if num.odd?
#   match5 = Match.create(matcher_id: user.id, matchee_id: matt.id) if num.even?

#   if match1 || match2 || match3 || match4 || match5
#     puts "#{num} has matched"
#   else
#     puts "ERROR matching"
#   end
# end

puts "Seeding complete"
