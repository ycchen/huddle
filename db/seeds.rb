# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'faker'
Rake::Task['db:reset'].invoke

User.create!(email: 'admin@test.com', password: 'foobar1234', password_confirmation: 'foobar1234', display_name: 'Admin', role: 'admin')

10.times do |n|
	User.create!(email: "user#{n}@test.com", password: "foobar1234", password_confirmation: "foobar1234", display_name: "User #{n}", role: "user")	
end

# num = (1..9).to_a
# num.shuffle[0..2]
# this will give me 3 random number between (1..9)
# 3.times.map{rand(1..9)}