# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

 
 # Create Lists
 10.times do
   list = List.create!(
     user: users.sample,
     title:  Faker::Lorem.words(5),
     description:   Faker::Lorem.sentence(2)
   )
 end

 lists = List.all

 
 # Create Items
 25.times do
   items = Item.create!(
     list: lists.sample,
     name: Faker::Lorem.words(5)
   )
 end


 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
 admin.save!
 


 puts "Seed finished"
 puts "#{Item.count} lists created"
 puts "#{List.count} items created"