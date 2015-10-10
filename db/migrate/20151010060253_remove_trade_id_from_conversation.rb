class RemoveTradeIdFromConversation < ActiveRecord::Migration
  def change
  	remove_column :conversations, :trade_id
  end
end
