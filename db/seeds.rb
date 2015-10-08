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


10.times do |i|
  x = i + 1
  User.create!({
    name: "User#{x}",
    email: "user#{x}@email.com",
    password: "1111",
    password_confirmation: "1111"
    })

  Garden.create!({
    user_id: x,
    # postal_code: "M5H 1W7"
    })

  Product.create!({
    garden_id: x,
    name: "Product #{x}a",
    description: "Description #{x}a",
    trade_info: "Trade info #{x}a"
    })

  Product.create!({
    garden_id: x,
    name: "Product #{x}b",
    description: "Description #{x}b",
    trade_info: "Trade info #{x}b"
    })

end

# User 2 is requesting Product 1a from User 1
Conversation.create!({
  product_id: 1,
  sender_id: 2,
  receiver_id: 1
  })

10.times do |i|
  x = i + 1
  Message.create!({
    title: "Message #{x}",
    content: "This message was sent from User 2 to User 1 regarding Product 1a",
    conversation_id: 1,
    sender_id: 2
    })

  Message.create!({
    title: "Message #{x} reply",
    content: "This message was sent from User 1 to User 2 regarding Product 1a",
    conversation_id: 1,
    sender_id: 1
    })
end

# User 3 is requesting Product 1b from User 1
Conversation.create!({
  product_id: 2,
  sender_id: 3,
  receiver_id: 1
  })

10.times do |i|
  x = i + 1
  Message.create!({
    title: "Message #{x}",
    content: "This message was sent from User 3 to User 1 regarding Product 1b",
    conversation_id: 2,
    sender_id: 3
    })

  Message.create!({
    title: "Message #{x} reply",
    content: "This message was sent from User 1 to User 3 regarding Product 1b",
    conversation_id: 2,
    sender_id: 1
    })
end

# User 4 is requesting Product 1 from User 1
Conversation.create!({
  product_id: 1,
  sender_id: 4,
  receiver_id: 1
  })

10.times do |i|
  x = i + 1
  Message.create!({
    title: "Message #{x}",
    content: "This message was sent from User 4 to User 1 regarding Product 1a",
    conversation_id: 3,
    sender_id: 4
    })

  Message.create!({
    title: "Message #{x} reply",
    content: "This message was sent from User 1 to User 4 regarding Product 1a",
    conversation_id: 3,
    sender_id: 1
    })
end

# User 5 is requesting Product 1 from User 1
Conversation.create!({
  product_id: 1,
  sender_id: 5,
  receiver_id: 1
  })

10.times do |i|
  x = i + 1
  Message.create!({
    title: "Message #{x}",
    content: "This message was sent from User 5 to User 1 regarding Product 1a",
    conversation_id: 4,
    sender_id: 5
    })

  Message.create!({
    title: "Message #{x} reply",
    content: "This message was sent from User 1 to User 5 regarding Product 1a",
    conversation_id: 4,
    sender_id: 1
    })
end