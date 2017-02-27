class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
