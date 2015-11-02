class AddTmpColToProductForCwBgrounder < ActiveRecord::Migration
  def change
  	add_column :products, :image_temp, :string
  end
end
