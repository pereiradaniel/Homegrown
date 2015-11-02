class RenameImageTempColToImageTmp < ActiveRecord::Migration
  def change
  	rename_column :products, :image_temp, :image_tmp
  end
end
