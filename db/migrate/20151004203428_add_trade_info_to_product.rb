class AddTradeInfoToProduct < ActiveRecord::Migration
  def change
    add_column :products, :trade_info, :text
  end
end
