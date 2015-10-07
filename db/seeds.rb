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


50.times do |i|
  x = i + 1
  User.create!({
    name: "User#{x}",
    email: "user#{x}@email.com",
    password: "1111",
    password_confirmation: "1111"
    })

  Garden.create!({
    user_id: x,
    postal_code: "M5H 1W7"
    })

  Product.create!({
    garden_id: x,
    name: "Product #{x}",
    description: "Description #{x}",
    trade_info: "Trade info #{x}"
    })

  Conversation.create!({
    product_id: x,
    sender_id: x + 1,
    receiver_id: x
    })

  Message.create!({
    title: "Message #{x}",
    content: "This message was sent from User#{x + 1} to User#{x} regarding Product #{x}",
    conversation_id: x,
    sender_id: x + 1
    })

  Message.create!({
    title: "Message #{x + 1}",
    content: "This message was sent from User#{x} to User#{x + 1} regarding Product #{x}",
    conversation_id: x,
    sender_id: x
    })


end