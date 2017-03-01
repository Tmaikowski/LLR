class AddFieldToPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :type, :string
  end
end
