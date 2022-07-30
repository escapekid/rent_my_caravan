# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  caravan = Caravan.create(
    name: Faker::Hipster.sentence,
    address: Faker::Address.street_address,
    price: rand(10..150),
    number_of_guests: rand(1..10),
    description: Faker::Hipster.paragraph,
    # photo: Faker::LoremFlickr.image(search_terms: ['caravan']),
    user_id: rand(1..3)
  )
  puts "Created #{caravan.name}"
end
puts "Finished!"
