class Advertiser < ActiveRecord::Migration
  def change
    create_table :advertiser do |t|
      t.string :name
      t.string :url
      t.string :aff_program
      t.string :affiliate_url
      t.string :is_active
      t.string :logo_url
      t.timestamps
    end
  end
end
