class AddInitialRequestColToConversation < ActiveRecord::Migration
  def change
  	add_column :conversations, :request, :string
  end
end
