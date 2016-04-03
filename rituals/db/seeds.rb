# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  User.create(first_name: Faker::Name.name , last_name: Faker::Name.last_name, password: Faker::Internet.password, email: Faker::Internet.email)
end

20.times do
  Memory.create(title: Faker::Hacker.noun, url: Faker::Avatar.image, description: Faker::Lorem.sentence, story: Faker::Lorem.sentences, user_id: rand(0..10)  )
end


# Membership.create(user_id: 1, family_id: 2)
# Membership.create(user_id: 1, family_id: 3)
