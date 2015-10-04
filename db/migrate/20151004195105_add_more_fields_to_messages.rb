class AddMoreFieldsToMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :user_id, :integer
    add_column :messages, :sender_id, :integer
    add_column :messages, :receiver_id, :integer
    add_column :messages, :product_id, :integer
    add_column :messages, :title, :text
    add_column :messages, :content, :text
  end
end
