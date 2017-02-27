class RemoveStatusCodeIdFromSale < ActiveRecord::Migration[5.0]
  def change
    remove_column :sales, :statuscode_id, :integer
  end
end
