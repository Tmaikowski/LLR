class AddRewardIdToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :reward_id, :integer
  end
end
