class RenameTradeEndedColToTradeIdOnConversation < ActiveRecord::Migration
  def change
  	remove_columns :conversations, :trade_ended
  end
end
