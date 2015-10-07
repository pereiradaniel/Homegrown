class AddPostalCodeToGarden < ActiveRecord::Migration
  def change
  	add_column :gardens, :postal_code, :string
  end
end
