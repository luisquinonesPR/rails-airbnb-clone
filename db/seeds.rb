# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"

Booking.destroy_all
Cow.destroy_all
User.destroy_all

puts "database cleared"

user_client = User.create!(email: "user_client@gmail.com", password: "password")
user_owner = User.create!(email: "user_owner@gmail.com", password: "password")
30.times do
  Cow.create!(
  name:Faker::TvShows::GameOfThrones.character,
	description:Faker::TvShows::GameOfThrones.quote,
  user: user_owner
 )

end
puts "seeding completed"
