class RenameTypeInPoints < ActiveRecord::Migration[5.0]
  def change
    rename_column :points, :type, :trans_type
  end
end
