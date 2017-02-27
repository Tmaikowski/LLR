class AddNullAttrToSales < ActiveRecord::Migration[5.0]
  def change
    change_column_null :sales, :invoice_id, true
  end
end
