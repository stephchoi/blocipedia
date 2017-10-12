# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'random_data'

12.times do 
    User.create!(
        email: RandomData.random_email,
        password: RandomData.random_sentence 
    )
end
users= User.all

35.times do
    Wiki.create!(
        user: users.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"