class User < ApplicationRecord
  has_secure_password
  has_many :clients
  has_many :products
  has_many :sales
  has_many :invoices
  belongs_to :team, optional: true
end
