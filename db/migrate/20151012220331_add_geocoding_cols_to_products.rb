class AddGeocodingColsToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :latitude, :float
  	add_column :products, :longitude, :float
  	add_column :products, :postal_code, :string

  end
end
