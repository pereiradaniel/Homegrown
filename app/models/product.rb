class Product < ActiveRecord::Base
  has_many :conversations
  belongs_to :garden
  belongs_to :trade
  validates :name, presence: true
  mount_uploader :image, ImageUploader
  acts_as_taggable

  geocoded_by :postal_code
  after_validation :geocode

  def self.find_by_tag(tag)
    Product.joins(@tags).where('tags.name LIKE ?', "%#{tag}%")
  end


end
