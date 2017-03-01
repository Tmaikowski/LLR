class Client < ApplicationRecord
  belongs_to :user
  belongs_to :reward, optional: true
  has_many :sales
  has_many :points

  def full_name
    "#{first_name} #{last_name}"
  end
end
