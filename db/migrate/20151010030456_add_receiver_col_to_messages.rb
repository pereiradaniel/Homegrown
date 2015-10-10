class AddReceiverColToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :receiver, :integer
  end
end
