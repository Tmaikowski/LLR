class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :prod_name
      t.string :prod_size
      t.decimal :prod_price, precision: 10, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
