class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :products
  belongs_to :garden
  geocoded_by :postal_code
  after_validation :geocode
end
