# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# 50.times do
#   Product.create!(
#     name: Faker::Commerce.product_name
#   )
# end

50.times do
  Product.create!(
    garden_id: (1..10).to_a.sample,
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    trade_info: Faker::Lorem.sentence
  )
end

(1..10).each do |i|
  Garden.create!(
    user_id: i
  )
end

