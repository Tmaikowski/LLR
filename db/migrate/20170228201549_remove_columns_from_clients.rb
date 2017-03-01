class RemoveColumnsFromClients < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :loyalty_level, :integer
    remove_column :clients, :points, :integer
  end
end
