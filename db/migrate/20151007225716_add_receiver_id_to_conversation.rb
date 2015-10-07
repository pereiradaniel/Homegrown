class AddReceiverIdToConversation < ActiveRecord::Migration
  def change
  	add_column :conversations, :receiver_id, :integer
  end
end
