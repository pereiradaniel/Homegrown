class RenameReceiverColMessages < ActiveRecord::Migration
  def change
  	rename_column :messages, :receiver, :receiver_id
  end
end
