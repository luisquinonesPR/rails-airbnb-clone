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

#new_user = User.create!(email: "fakeemail@gmail.com", password: "")

photos = [

]

30.times do
  cow = Cow.create!(
  name:Faker::GameOfThrones.character,
	description: Faker::GameOfThrones.quote,
  user: new_user
  )

  file = URI.open(photos.sample)
end
