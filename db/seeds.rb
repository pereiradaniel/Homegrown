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
profile_picture_array = ["profile1", "profile2", "profile3", "profile4", "profile5", "profile6", "profile7", "profile8", "profile9",
  "profile10", "profile11", "profile12", "profile13","profile14", "profile15", "profile16", "profile17", "profile18",
  "profile19", "profile20"]
postal_code_array = ["M5G 2L5", "M4R 1P2", "M1B 5W7", "M4W 3X8", "M6J 2V5", "M5G 1C3", "M5A 3H6", "M1H 1B2", "M1K 1R8", "M5S 3H7", "M5A 3W8", "M5H 1W7", "M7A 1Y7", "M1J 2E1", "L4B 3P4", "M9C 2Y2", "M5H 2M3", "M2N 5V7", "M2J 5A7"]
product_name_array = ["Apple", "Pepper", "Potato", "Garlic", "Sweet potato", "Hot pepper", "Sweet pepper",
  "Chives", "Lettuce", "Tomato", "Roma tomato", "Green apple", "Macintosh apple", "Uncle Bob's Super Gala Apple",
  "Zucchini", "Greenhouse Zucchinis", "Squash", "Hydroponic Tomatoes", "Basil Leaves", "Oregano", "Dried and cured Oregano",
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
  "Lisa", "James", "Hong", "Simon", "Imran", "Masterful Mina", "Intelligent Ilia", "Mega Matt", "Naturalie Natalie", "Erik The #F00", "Amazing Adrian"]
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

@tags_array = ["green", "red", "brown", "purple", "white", "black", "sweet", "spicy", "juicy", "crunchy", "organic", "GMO", "traditional",
  "hot", "tasty", "legume", "vegetable", "berry", "herb", "dried", "preserved", "no artificial fertilizer", "large", "small", "giant", "medium",
  "asian", "carribean", "eurpoean", "african", "north american", "special", "mexican", "south american", "backyard", "hydroponic", "fancy", "plain",
  "fresh", "stewable"]

@app_tags_array = ["leafy green", "root", "fruit vegetable", "berries", "pomes", "citrus"]

negotiation_success_result_array = ["Thanks!", "Good job!", "Great produce!"]
negotiation_unsuccess_result_array = ["Sorry :(", "I'm all out!", "I will have more again soon!"]

def get_tags(num_of_tags)
  @array_of_tags = []
  
  num_of_tags.times do
    @array_of_tags.push(@tags_array[rand(@tags_array.size)])
  end

  @array_of_tags.push(@app_tags_array[rand(@app_tags_array.size)])

  return @array_of_tags
end


5.times do |i|
  x = i + 1
  User.create!({
    name: user_names[rand(user_names.size)],
    email: "user#{x}@email.com",
    image: profile_picture_array[rand(picture_array.size)] + ".jpg",
    password: "1111",
    password_confirmation: "1111"
    })

  Garden.create!({
    user_id: x,
    postal_code: postal_code_array[rand(postal_code_array.size)]
    })

  Product.create!({
    garden_id: x,
    name: product_name_array[rand(product_name_array.size)],
    description: product_description_array[rand(product_description_array.size)],
    trade_info: trade_array[rand(trade_array.size)],
    postal_code: Garden.last.postal_code,
    image: picture_array[rand(picture_array.size)] + ".jpg",
    tag_list: get_tags(rand(1..10))
    })

  Product.create!({
    garden_id: x,
    name: product_name_array[rand(product_name_array.size)],
    description: product_description_array[rand(product_description_array.size)],
    trade_info: trade_array[rand(trade_array.size)],
    postal_code: Garden.last.postal_code,
    image: picture_array[rand(picture_array.size)] + ".jpg",
    tag_list: get_tags(rand(1..10))
    })
end

5.times do |i|
  x = i + 1 + 5
  User.create!({
    name: user_names[rand(user_names.size)],
    email: "user#{x}@email.com",
    image: profile_picture_array[rand(picture_array.size)] + ".jpg",
    password: "1111",
    password_confirmation: "1111"
    })

  Garden.create!({
    user_id: x,
    postal_code: postal_code_array[rand(postal_code_array.size)]
    })

  Product.create!({
    garden_id: x,
    name: product_name_array[rand(product_name_array.size)],
    description: product_description_array[rand(product_description_array.size)],
    trade_info: trade_array[rand(trade_array.size)],
    postal_code: Garden.last.postal_code,
    image: picture_array[rand(picture_array.size)] + ".jpg",
    tag_list: get_tags(rand(1..10))
    })

  Product.create!({
    garden_id: x,
    name: product_name_array[rand(product_name_array.size)],
    description: product_description_array[rand(product_description_array.size)],
    trade_info: trade_array[rand(trade_array.size)],
    postal_code: Garden.last.postal_code,
    image: picture_array[rand(picture_array.size)] + ".jpg",
    tag_list: get_tags(rand(1..10))
    })
end


10.times do |i|
    User.create!({
      name: user_names[rand(user_names.size)],
      email: email_handle[rand(email_handle.size)] + email_nicks[rand(email_nicks.size)] + Random.rand(666).to_s + "@" + email_array[rand(email_array.size)] + domain_array[rand(domain_array.size)],
      image: profile_picture_array[rand(picture_array.size)] + ".jpg",
      password: "1111",
      password_confirmation: "1111"
      })

    Garden.create!({
      user_id: User.last.id,
      postal_code: postal_code_array[rand(postal_code_array.size)]
      })

  10.times do |x|
      Product.create!({
        garden_id: Garden.last.id,
        name: product_name_array[rand(product_name_array.size)],
        description: product_description_array[rand(product_description_array.size)],
        trade_info: trade_array[rand(trade_array.size)],
        postal_code: Garden.last.postal_code,
        image: picture_array[rand(picture_array.size)] + ".jpg",
        tag_list: get_tags(rand(1..10))
        })
  end

 offset = rand(Product.count)
 rand_product = Product.offset(offset).first

  5.times do |x|
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
          conversation_id: Conversation.last.id,
          sender_id: Conversation.last.sender.id,
          receiver_id: Conversation.last.receiver.id
          })

        Message.create!({
          content: message_array[rand(message_array.size)],
          conversation_id: Conversation.last.id,
          sender_id: Conversation.last.receiver.id,
          receiver_id: Conversation.last.sender.id
          })
      end
  end
end

10.times do |x|
  i = x + 1
  
    Product.create!({
      garden_id: i,
      name: product_name_array[rand(product_name_array.size)],
      description: product_description_array[rand(product_description_array.size)],
      trade_info: trade_array[rand(trade_array.size)],
      postal_code: Garden.find(i).postal_code,
      image: picture_array[rand(picture_array.size)] + ".jpg",
      tag_list: get_tags(rand(1..10))
      })

    3.times do
        Conversation.create!({
          request: request_array[rand(request_array.size)],
          product_id: Product.last.id,
          sender_id: User.find(rand((i + 1)..20)).id,
          receiver_id: Product.last.garden.user.id
          })

        3.times do
          Message.create!({
            content: message_array[rand(message_array.size)],
            conversation_id: Conversation.last.id,
            sender_id: Conversation.last.sender.id,
            receiver_id: Conversation.last.receiver.id
            })

          Message.create!({
            content: message_array[rand(message_array.size)],
            conversation_id: Conversation.last.id,
            sender_id: Conversation.last.receiver.id,
            receiver_id: Conversation.last.sender.id
            })
        end
      end
    
    Trade.create!({
      negotiation_result: negotiation_success_result_array[rand(negotiation_success_result_array.size)],
      seller_id: Conversation.last.receiver.id,
      buyer_id: Conversation.last.sender.id,
      product_id: Product.last.id,
      conversation_id: Conversation.last.id,
      success: true
      })

    Product.create!({
        garden_id: i,
        name: product_name_array[rand(product_name_array.size)],
        description: product_description_array[rand(product_description_array.size)],
        trade_info: trade_array[rand(trade_array.size)],
        postal_code: Garden.find(i).postal_code,
        image: picture_array[rand(picture_array.size)] + ".jpg",
        tag_list: get_tags(rand(1..10))
        })
      
    3.times do
      Conversation.create!({
        request: request_array[rand(request_array.size)],
        product_id: Product.last.id,
        sender_id: User.find(rand((i + 1)..20)).id,
        receiver_id: Product.last.garden.user.id
        })

      3.times do    
        Message.create!({
          content: message_array[rand(message_array.size)],
          conversation_id: Conversation.last.id,
          sender_id: Conversation.last.sender.id,
          receiver_id: Conversation.last.receiver.id
          })

        Message.create!({
          content: message_array[rand(message_array.size)],
          conversation_id: Conversation.last.id,
          sender_id: Conversation.last.receiver.id,
          receiver_id: Conversation.last.sender.id
          })
      end
    end

    Trade.create!({
      negotiation_result: negotiation_unsuccess_result_array[rand(negotiation_unsuccess_result_array.size)],
      seller_id: Conversation.last.receiver.id,
      buyer_id: Conversation.last.sender.id,
      product_id: Product.last.id,
      conversation_id: Conversation.last.id,
      success: false
      })
end