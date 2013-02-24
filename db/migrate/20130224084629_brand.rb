class Brand < ActiveRecord::Migration
  def change
    create_table :brand do |t|
      t.string :name
      t.string :main_url
      t.string :logo_url
      t.timestamps
    end
  end
end
