class RenameProductIdColMessagesToSenderId < ActiveRecord::Migration
  def change
  	rename_column :messages, :product_id, :sender_id
  end
end
