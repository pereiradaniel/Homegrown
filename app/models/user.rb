class User < ActiveRecord::Base
  has_one :garden
  has_many :products, through: :garden
  has_many :messages
end
