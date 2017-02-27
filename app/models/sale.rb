class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :product
  belongs_to :sales_code
  belongs_to :invoice, optional: true


  def sale_for_invoice
    "#{self.product.prod_name} - #{self.product.prod_size}"
  end
end
