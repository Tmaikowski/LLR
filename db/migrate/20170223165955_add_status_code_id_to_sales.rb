class AddStatusCodeIdToSales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :statuscode_id, :integer
  end
end
