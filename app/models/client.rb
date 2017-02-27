class Client < ApplicationRecord
  belongs_to :user
  has_many :sales
  has_many :products, through: :sales
  has_many :invoices

  def full_name
    "#{first_name} #{last_name}"
  end
end
