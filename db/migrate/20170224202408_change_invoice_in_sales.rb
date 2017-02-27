class ChangeInvoiceInSales < ActiveRecord::Migration[5.0]
  def change
    remove_column :sales, :invoice_id, :integer
  end
end
