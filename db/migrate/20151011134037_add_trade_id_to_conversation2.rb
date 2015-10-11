class AddTradeIdToConversation2 < ActiveRecord::Migration
  def change
  	add_column :conversations, :trade_id, :integer
  end
end
