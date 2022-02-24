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
photos = ['https://images.unsplash.com/photo-1527153857715-3908f2bae5e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1088&q=80',
  'https://images.unsplash.com/photo-1583364428520-fa6c5013c0c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
  'https://images.unsplash.com/photo-1567454712317-27834ca8fce2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=702&q=80',
  'https://images.unsplash.com/photo-1545468800-85cc9bc6ecf7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80',
  'https://images.unsplash.com/photo-1619865482177-71d195df05b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  'https://images.unsplash.com/photo-1618080206739-14e8ac105472?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80',
  'https://images.unsplash.com/photo-1551606712-ce1d9e8fbee4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
  'https://images.unsplash.com/photo-1604860428762-f55cea62b7a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
  'https://images.unsplash.com/photo-1568794045709-edaad184e7da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
  'https://images.unsplash.com/photo-1556997685-309989c1aa82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80'
]

address = ["Carrer de Joaquim Ruyra, 9, 11, 08025 Barcelona", "Carrer de Bruniquer, 69, 08024 Barcelona", "Carrer de Torrijos, 47B, 08012 Barcelona",
  "Carrer d'Aribau, 174, 08036 Barcelona","Pg. de Gràcia, 43, 08007 Barcelona", "Carrer del Rosselló, 307, 08037 Barcelona"]

10.times do
  cow = Cow.create!(
    address: address.sample,
    name:Faker::TvShows::GameOfThrones.character,
    description:Faker::TvShows::GameOfThrones.quote,
    user: user_owner
  )

  file = URI.open(photos.sample)
  cow.photo.attach(io: file, filename: cow.name, content_type: 'image/jpeg')
end

puts "seeding completed"
