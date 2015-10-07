class AddLatitudeAndLongitudeToGarden < ActiveRecord::Migration
  def change
  	add_column :gardens, :latitude, :float
  	add_column :gardens, :longitude, :float
  end
end
