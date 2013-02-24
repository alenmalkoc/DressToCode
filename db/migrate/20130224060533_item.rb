class Item < ActiveRecord::Migration
  def change
    create_table :item do |t|
      t.string :name
      t.string :brand
      t.string :price
      t.string :link
      t.string :advertiser
      t.string :click
      t.string :is_active
      t.timestamps
    end
  end
end
