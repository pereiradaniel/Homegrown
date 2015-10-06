class Product < ActiveRecord::Base
  # belongs_to :user
  has_many :messages

  validates :name, presence: true
  belongs_to :garden
  mount_uploader :image, ImageUploader

end
