class RemoveCaptainIdFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :captain_id, :integer
    add_column :users, :team_authority, :integer
  end
end
