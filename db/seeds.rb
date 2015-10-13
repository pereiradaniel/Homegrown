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


5.times do |i|
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
    name: "Product #{x}a",
    description: "Description #{x}a",
    trade_info: "Trade info #{x}a",
    postal_code: "M5H 1W7"    
    })

  Product.create!({
    garden_id: x,
    name: "Product #{x}b",
    description: "Description #{x}b",
    trade_info: "Trade info #{x}b",
    postal_code: "M5H 1W7"
    })

end

5.times do |i|
  x = i + 1 + 5
  User.create!({
    name: "User#{x}",
    email: "user#{x}@email.com",
    password: "1111",
    password_confirmation: "1111"
    })

  Garden.create!({
    user_id: x,
    postal_code: "M1S 1B7"
    })

  Product.create!({
    garden_id: x,
    name: "Product #{x}a",
    description: "Description #{x}a",
    trade_info: "Trade info #{x}a",
    postal_code: "M1S 1B7"
    })

  Product.create!({
    garden_id: x,
    name: "Product #{x}b",
    description: "Description #{x}b",
    trade_info: "Trade info #{x}b",
    postal_code: "M1S 1B7"
    })

end

# User 2 is requesting Product 1a from User 1
Conversation.create!({
  request: "I will trade you x for y.",
  product_id: 1,
  sender_id: 2,
  receiver_id: 1
  })

5.times do |i|
  x = i + 1
  Message.create!({
    content: "This message was sent from User 2 to User 1 regarding Product 1a",
    conversation_id: 1,
    receiver_id: 1,
    sender_id: 2
    })

  Message.create!({
    content: "This message was sent from User 1 to User 2 regarding Product 1a",
    conversation_id: 1,
    receiver_id: 2,
    sender_id: 1
    })
end

# User 3 is requesting Product 1b from User 1
Conversation.create!({
  request: "I will buy 4 of this product for the price you are asking",
  product_id: 2,
  sender_id: 3,
  receiver_id: 1
  })

5.times do |i|
  x = i + 1
  Message.create!({
    content: "This message was sent from User 3 to User 1 regarding Product 1b",
    conversation_id: 2,
    sender_id: 3,
    receiver_id: 1

    })

  Message.create!({
    content: "This message was sent from User 1 to User 3 regarding Product 1b",
    conversation_id: 2,
    sender_id: 1,
    receiver_id: 3

    })
end

# User 4 is requesting Product 1 from User 1
Conversation.create!({
  request: "I see you are giving this away, can I please have 2?",
  product_id: 1,
  sender_id: 4,
  receiver_id: 1
  })

3.times do |i|
  x = i + 1
  Message.create!({
    content: "This message was sent from User 4 to User 1 regarding Product 1a",
    conversation_id: 3,
    sender_id: 4,
    receiver_id: 1
    })

  Message.create!({
    content: "This message was sent from User 1 to User 4 regarding Product 1a",
    conversation_id: 3,
    sender_id: 1,
    receiver_id: 4
    })
end

# User 5 is requesting Product 1 from User 1
Conversation.create!({
  request: "I'm not sure what I can trade for this, but I have x that you may be interested in.",
  product_id: 1,
  sender_id: 5,
  receiver_id: 1
  })

4.times do |i|
  x = i + 1
  Message.create!({
    content: "This message was sent from User 5 to User 1 regarding Product 1a",
    conversation_id: 4,
    sender_id: 5,
    receiver_id: 1

    })

  Message.create!({
    content: "This message was sent from User 1 to User 5 regarding Product 1a",
    conversation_id: 4,
    sender_id: 1,
    receiver_id: 5

    })
end

Trade.create!({
  negotiation_result: "Good trade!  Thanks.",
  seller_id: 1,
  buyer_id: 5,
  product_id: 1,
  conversation_id: 4,
  success: true
})