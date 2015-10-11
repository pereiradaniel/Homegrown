class AddSuccessColToTrade < ActiveRecord::Migration
  def change
  	add_column :trades, :success, :boolean
  end
end
