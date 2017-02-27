class AddCaptainToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :captain_id, :integer
  end
end
