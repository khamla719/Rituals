# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: "aaron", last_name: "lastname", password: "password", email: "aaron@aaron.com")
User.create(first_name: "khamla", last_name: "lastname", password: "password", email: "khamla@khamla.com")
User.create(first_name: "tim", last_name: "lastname", password: "password", email: "as@aaron.com")

# Membership.create(user_id: 1, family_id: 2)
# Membership.create(user_id: 1, family_id: 3)