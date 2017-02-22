class RemoveColumnsFromSale < ActiveRecord::Migration[5.0]
  def change
    remove_column :sales, :prod_color
    remove_column :sales, :prod_line
  end
end
