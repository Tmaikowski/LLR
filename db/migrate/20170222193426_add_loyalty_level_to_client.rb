class AddLoyaltyLevelToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :loyalty_level, :string
  end
end
