class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :garden_id, :integer
  end
end
