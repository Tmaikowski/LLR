class Product < ApplicationRecord
  has_attached_file :prod_pic
  belongs_to :user
  has_many :sales
  has_many :clients, through: :sales

  validates_attachment_content_type :prod_pic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def prod_desc
    "#{prod_name} - #{prod_size}"
  end
end
