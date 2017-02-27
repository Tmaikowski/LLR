class AddInvoiceIdToSales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :invoice_id, :integer, null: true
  end
end
