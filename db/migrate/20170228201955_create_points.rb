class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.integer :amount
      t.text :reason
      t.integer :client_id
      t.integer :user_id

      t.timestamps
    end
  end
end
