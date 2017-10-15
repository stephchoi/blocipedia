# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'random_data'
require 'faker'

Faker::UniqueGenerator.clear

12.times do 
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(6, 14) 
    )
end
users= User.all

25.times do
    Wiki.create!(
        user: users.sample,
        title: Faker::HarryPotter.character + Faker::HarryPotter.house,
        body: Faker::HarryPotter.quote + Faker::HarryPotter.book
    )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"