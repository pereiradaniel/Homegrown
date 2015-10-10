class AddTradeEndedColToConversation < ActiveRecord::Migration
  def change
  	add_column :conversations, :trade_ended, :boolean
  end
end
