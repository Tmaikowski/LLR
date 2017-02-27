class AddQuantityToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :prod_quantity, :integer
  end
end
