# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# 10.times do
#   User.create(first_name: Faker::Name.name , last_name: Faker::Name.last_name, password: Faker::Internet.password, email: Faker::Internet.email)
# end

# 20.times do
#   Memory.create(title: Faker::Hacker.noun, url: Faker::Placeholdit.image, description: Faker::Hipster.sentence, story: Faker::Hipster.paragraph, user_id: rand(0..10)  )
# end

User.create(first_name: "aaron", last_name: "lastname", password: "password", email: "aaron@aaron.com")
User.create(first_name: "khamla", last_name: "lastname", password: "password", email: "khamla@khamla.com")
User.create(first_name: "tim", last_name: "lastname", password: "password", email: "as@aaron.com")

# Membership.create(user_id: 1, family_id: 2)
# Membership.create(user_id: 1, family_id: 3)
