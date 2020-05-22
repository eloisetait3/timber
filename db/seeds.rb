# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"
User.destroy_all
House.destroy_all
user = User.create!(email: "test@email.com", password: "testtesttest")

house_list = []
25.times do 
  house_list<<[ "#{Faker::Games::ElderScrolls.city} Treehouse" ,"#{Faker::Address.unique.full_address}"," #{Faker::Quote.unique.yoda}", "#{rand(1..200)}"]
end 

house_list.each do |name, location, description, price|
  House.create!(user:user, name: name, location: location, description: description, price: price )
end 

# file = URI.open('https://images.unsplash.com/photo-1578010896624-fa4dd2c708b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80')
# house_1 = House.new( user: user, name: "Robin Hood Treehouse", location: "Sherwood Forest, Nottinghamshire", description: "Rustic and understated treehouse, in the centre of one of Britain's most historic forests. Watch out for local bandits." , price: 30 )
# house_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
# house_1.save!

# House.create!( user: user, name: "Boutique Luxury Treehouse", location: "Shere, Surrey", description: "Secluded and well-provisioned treehouse with everything you need for a quiet getaway.", price: 70 )
# House.create!( user: user, name: "Garden Shed Treehouse", location: "Miami, Florida, USA", description: "Pretty close to the ground. It's on the ground. It's not a treehouse. For those afraid of heights.", price:10 )
# House.create!( user: user, name: "Central Park Treehouse", location: "Central Park, New York, USA" , description: "Incredible central location, and perfect position to just watch the world go by. You won't find a better priced stay in the city.", price:120 )
# House.create!( user: user, name: "Loch Lomond Treehouse", location: "Loch Lomond, Scotland", description:"A perfect place to reflect on the the breathtaking views offered by Loch Lomond.", price:30 )
