class Invoice < ApplicationRecord
  has_attached_file :invoice

  belongs_to :user
  belongs_to :client
  has_many :sales

  validates_attachment_content_type :invoice, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
end
