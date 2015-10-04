class Product < ActiveRecord::Base
  belongs_to :garden
  belongs_to :user
  has_many :messages
end
