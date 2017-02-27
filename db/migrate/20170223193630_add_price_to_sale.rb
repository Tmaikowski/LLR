class AddPriceToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :sale_price, :decimal, precision: 10, scale: 2
  end
end
