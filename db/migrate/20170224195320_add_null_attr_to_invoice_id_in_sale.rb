class AddNullAttrToInvoiceIdInSale < ActiveRecord::Migration[5.0]
  def change
    change_column :sales, :invoice_id, :integer, null: true
  end
end
