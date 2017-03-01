class RemoveColumnsFromSales < ActiveRecord::Migration[5.0]
  def change
    remove_column :sales, :product_id, :integer
    remove_column :sales, :sales_code_id, :integer
    remove_column :sales, :invoice_id, :integer
  end
end
