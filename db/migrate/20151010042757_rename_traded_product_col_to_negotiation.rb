class RenameTradedProductColToNegotiation < ActiveRecord::Migration
  def change
  	rename_column :trades, :traded_product, :negotiation_result
  end
end
