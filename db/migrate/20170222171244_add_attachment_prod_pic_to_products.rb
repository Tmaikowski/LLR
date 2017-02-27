class AddAttachmentProdPicToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :prod_pic
    end
  end

  def self.down
    remove_attachment :products, :prod_pic
  end
end
