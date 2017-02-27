class CreateSalesCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_codes do |t|
      t.string :status

      t.timestamps
    end
  end
end
