class AddColsToConversation < ActiveRecord::Migration
  def change
  	add_column :conversations, :sender_id, :integer
  	add_column :conversations, :product_id, :integer
  end
end
