class Product < ActiveRecord::Base
  # belongs_to :user
  has_many :messages

  # attr_accessible :product_id, :name, :image
  belongs_to :garden
  mount_uploader :image, ImageUploader

end
