class AddAttachmentInvoiceToInvoices < ActiveRecord::Migration
  def self.up
    change_table :invoices do |t|
      t.attachment :invoice
    end
  end

  def self.down
    remove_attachment :invoices, :invoice
  end
end
