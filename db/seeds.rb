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

# ary[rand(ary.size)]

picture_array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
profile_picture_array = ["profile1", "profile2", "profile3", "profile4", "profile5", "profile6", "profile7", "profile8", "profile9"]
postal_code_array = ["M5H 1W7", "M7A 1Y7", "M1J 2E1", "L4B 3P4", "M9C 2Y2", "M5H 2M3", "M2N 5V7", "M2J 5A7"]
# postal_code: postal_code_array[rand(ary.size)]
product_name_array = ["Apple", "Pepper", "Potato", "Garlic", "Sweet potato", "Hot pepper", "Sweet pepper",
  "Chives", "Lettuce", "Tomato", "Roma tomato", "Green apple", "Macintosh apple", "Uncle Bob's Super Gala Apple",
  "Zucchini", "Uncle Orazio's Special Greenhouse Zucchinis", "Hydroponic Tomatoes", "Basil", "Oregano", "Dried and cured Oregano",
  "Spanish Onion", "Onion", "Green Onion"]
email_array = ["hotmail", "yahoo", "gmail"]
product_description_array = ["Juicy and tender", "Picked last week!", "My first attempt growing these.", "My special growing technique!",
  "Made with love!", "For those of the organic persuasion.", "Grown in dirt.", "All-natural ferilizer", "Straight from my backyard.",
  "Special genetically modified seeds for Canadian climate.", "From the heritage seed bank.  An old-school produce.", "Grown with seeds from Africa.",
  "My grandmother's special seeds, passed down through generations."]
trade_array = ["For free!  1 x bushel per request.  Send a request, and I'll tell you where to pick it up.", "I would like to trade with whatever you are growing.",
  "I am selling these for $2 / bunch.", "I am giving these away!", "Would like to hear what you have to trade, please send a request for negotiation.",
  "I want to trade these for some nice herbs and spices, nothing in particular.  Send me a request and we can discuss.", "$5 / bushel OBO.",
  "Would love to trade with someone who is good at growing corn.", "Not sure what I'd like to trade these for, or you can purchase for $10 for a large bushel, $5 for small bushel."]
user_names = ["Farmer Joe", "Miguel", "Johnny", "Sally", "Uncle Bob", "Jessie", "Big Mike", "Orlando", "Diana", "Ravinder", "Rohini",
  "Lisa", "James", "Hong", "Simon", "Imran", "Masterful Mina", "Intelligent Ilia", "Mega Matt", "Naturalie Natalie", "Erik 'The Grilled Cheeser' Dohnberg", "Adrian aka 'Jaclyn 2.0'"]
request_array = ["I want to buy right away for the price you are asking!  Can you supply 5 or 6?", "Could you trade me 3 of these for 5 of my special basil leaves?  They are already prepared for use",
  "Wow I would love to have 10 of these if possible, but could you give me a 10% discount on the bulk order?", "I don't have anything to trade, but could you sell me some?",
  "That is a great price!  Can I pick up 3x by this Friday?", "Hey those look pretty good!  Did you see my special apples?  Mayby we could trade a bushel for a bushel??? :)",
  "What species did you grow?  I may be interested in paying top $$$ for a nice big jar.", "I like these :) Can you sell me 3 bushels and can I pick up by Wednesday?",
  "Wow all your stuff looks great!  How fresh are they?  I want a bag of those before the weekend, I'm making a pie!", "Those would look good in my grandma's recipe, can I buy a jar and pick up tomorrow?",
  "Awesome produce!  I have lots to trade, check out my page and see waht you like!  :P", "Dude, your produce looks great!  I have nothing to trade, but can I buy some of these???"]
message_array = ["Ok!", "Not sure, let me check.", "I only have 2 left!", "That sounds good.", "Can you pick up by tomorrow?", "I will be away until Tuesday.",
  "Sorry I'm all out!  I have to de-list the product.", "There's more than enough, come get it!", "These will be ready next week."]
email_handle = ["super_", "mega_", "greasy_", "the_amazing_", "litte_", "big_", "rasta_", "bigmouth_", "blue_eyes_", "old_", "young_", "dude_"]
email_nicks = ["dave", "strongman", "viking", "larry", "holmes", "king", "princess", "goofy", "granny", "gramps", "daddy", "skater", "biker",
  "redhead", "rebel", "master_chef", "dancer", "pianist", "noodles", "baldy", "trailer_park_guy"]
domain_array = [".com", ".ca", ".cx", ".biz", ".uk", ".org", ".ru", ".net", ".cn", ".jp", ".pt", ".br", ".ge", ".ir", ".au", ".nz", ".ro", ".pl"]

tags_array = ["green", "red", "brown", "purple", "white", "black", "sweet", "spicy", "juicy", "crunchy", "organic", "GMO", "traditional",
  "hot", "tasty", "legume", "vegetable", "berry", "herb", "dried", "preserved", "no artificial fertilizer", "large", "small", "giant", "medium",
  "asian", "carribean", "eurpoean", "african", "north american", "special", "mexican", "south american", "backyard", "hydroponic", "fancy", "plain",
  "fresh", "stewable"]

# tags_array.each do |tag|
#   Tag.create!({
#     name: tag
#   })
# end

5.times do |i|
  x = i + 1
  User.create!({
    name: "User#{x}",
    email: "user#{x}@email.com",
    image: open("#{Rails.root}/app/assets/images/" + profile_picture_array[rand(picture_array.size)] + ".jpg"),
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
    postal_code: "M5H 1W7",
    image: open("#{Rails.root}/app/assets/images/" + picture_array[rand(picture_array.size)] + ".jpg")
    })

  Product.create!({
    garden_id: x,
    name: "Product #{x}b",
    description: "Description #{x}b",
    trade_info: "Trade info #{x}b",
    postal_code: "M5H 1W7",
    image: open("#{Rails.root}/app/assets/images/" + picture_array[rand(picture_array.size)] + ".jpg")
    })

end

5.times do |i|
  x = i + 1 + 5
  User.create!({
    name: "User#{x}",
    email: "user#{x}@email.com",
    image: open("#{Rails.root}/app/assets/images/" + profile_picture_array[rand(picture_array.size)] + ".jpg"),
    password: "1111",
    password_confirmation: "1111"
    })

  Garden.create!({
    user_id: x,
    postal_code: "M9C 2Y2"
    })

  Product.create!({
    garden_id: x,
    name: "Product #{x}a",
    description: "Description #{x}a",
    trade_info: "Trade info #{x}a",
    postal_code: "M9C 2Y2",
    image: open("#{Rails.root}/app/assets/images/" + picture_array[rand(picture_array.size)] + ".jpg")
    })

  Product.create!({
    garden_id: x,
    name: "Product #{x}b",
    description: "Description #{x}b",
    trade_info: "Trade info #{x}b",
    postal_code: "M9C 2Y2",
    image: open("#{Rails.root}/app/assets/images/" + picture_array[rand(picture_array.size)] + ".jpg")
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

8.times do |i|
    User.create!({
      name: user_names[rand(user_names.size)],
      email: email_handle[rand(email_handle.size)] + email_nicks[rand(email_nicks.size)] + Random.rand(666).to_s + "@" + email_array[rand(email_array.size)] + domain_array[rand(domain_array.size)],
      image: open("#{Rails.root}/app/assets/images/" + profile_picture_array[rand(picture_array.size)] + ".jpg"),
      password: "1111",
      password_confirmation: "1111"
      })

    Garden.create!({
      user_id: User.last.id,
      postal_code: postal_code_array[rand(postal_code_array.size)]
      })

    Product.create!({
      garden_id: Garden.last.id,
      name: product_name_array[rand(product_name_array.size)],
      description: product_description_array[rand(product_description_array.size)],
      trade_info: trade_array[rand(trade_array.size)],
      postal_code: Garden.last.postal_code,
      image: open("#{Rails.root}/app/assets/images/" + picture_array[rand(picture_array.size)] + ".jpg")
      })

    Product.create!({
      garden_id: Garden.last.id,
      name: product_name_array[rand(product_name_array.size)],
      description: product_description_array[rand(product_description_array.size)],
      trade_info: trade_array[rand(trade_array.size)],
      postal_code: Garden.last.postal_code,
      image: open("#{Rails.root}/app/assets/images/" + picture_array[rand(picture_array.size)] + ".jpg")
      })

    Product.create!({
      garden_id: Garden.last.id,
      name: product_name_array[rand(product_name_array.size)],
      description: product_description_array[rand(product_description_array.size)],
      trade_info: trade_array[rand(trade_array.size)],
      postal_code: Garden.last.postal_code,
      image: open("#{Rails.root}/app/assets/images/" + picture_array[rand(picture_array.size)] + ".jpg")
      })

  # rand_product = Product.order("RANDOM()").first

 offset = rand(Product.count)
 rand_product = Product.offset(offset).first

  Conversation.create!({
    request: request_array[rand(request_array.size)],
    product_id: rand_product.id,
    sender_id: User.last.id,
    receiver_id: rand_product.garden.user.id
    })

  5.times do |i|
      x = i + 1
      Message.create!({
        content: message_array[rand(message_array.size)],
        conversation_id: Conversation.last,
        sender_id: Conversation.last.sender.id,
        receiver_id: Conversation.last.receiver.id
        })

      Message.create!({
        content: message_array[rand(message_array.size)],
        conversation_id: Conversation.last,
        sender_id: Conversation.last.receiver.id,
        receiver_id: Conversation.last.sender.id
        })
    end

end