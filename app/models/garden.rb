class Garden < ActiveRecord::Base
  belongs_to :user
  has_many :products
  geocoded_by :postal_code
  after_validation :geocode
end
