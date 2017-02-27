class AddPointsToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :points, :integer
  end
end
