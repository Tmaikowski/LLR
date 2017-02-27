class AddSalesCodeIdToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :sales_code_id, :integer
  end
end
