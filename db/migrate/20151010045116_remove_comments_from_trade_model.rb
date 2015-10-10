class RemoveCommentsFromTradeModel < ActiveRecord::Migration
  def change
  	remove_column :trades, :buyer_comment
  	remove_column :trades, :seller_comment
  end
end
