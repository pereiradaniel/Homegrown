class RenameSenderIdColOnMessageToConversationId < ActiveRecord::Migration
  def change
  	rename_column :messages, :sender_id, :conversation_id
  end
end
