class AddConversationIdToTradeModel2 < ActiveRecord::Migration
  def change
    add_column :trades, :conversation_id, :integer
  end
end
