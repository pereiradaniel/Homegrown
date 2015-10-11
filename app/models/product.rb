class Product < ActiveRecord::Base
  has_many :conversations
  belongs_to :garden
  belongs_to :trade
  validates :name, presence: true
  mount_uploader :image, ImageUploader
  acts_as_taggable

  def get_distance(product)
  	location = product.garden
	  	if location.geocoded?
	  		location.nearbys(10)
	  		@proximity = location.distance_from([])
	  	end
  end


end
