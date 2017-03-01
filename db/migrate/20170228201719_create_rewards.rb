class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :level
      t.decimal :multiplier, precision: 5, scale: 2

      t.timestamps
    end
  end
end
