class RemovePriceFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :prod_price, :decimal, precision: 10, scale: 2
  end
end
