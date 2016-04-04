# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  fake_user = User.create(first_name: Faker::Name.name , last_name: Faker::Name.last_name, password: "password", email: Faker::Internet.email)
  10.times do
    fake_user.memories.create(title: Faker::Hacker.noun, url: Faker::Avatar.image, description: Faker::Lorem.sentence, story: Faker::Lorem.sentences)
  end
end



user = User.create(first_name: "Aaron", last_name: "Hu", email: "aaron@aaron.com", password: "password")



Membership.create(user_id: 1, family_id: 2)
Membership.create(user_id: 1, family_id: 3)
