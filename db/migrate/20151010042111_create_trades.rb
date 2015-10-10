class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :traded_product
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :product_id
      t.string :buyer_comment
      t.string :seller_comment
      t.timestamps null: false
    end
  end
end
