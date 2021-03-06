# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  Tool.create(name: Faker::Commerce.product_name, status: "in")
end



10.times do
  Event.create(date: Faker::Date.forward(23), title: Faker::App.name, content: "This is an event")
end

10.times do
  Post.create(
    content: Faker::Lorem.paragraph,
    title: Faker::Hacker.ingverb + " " + Faker::Hacker.noun
  )
end
