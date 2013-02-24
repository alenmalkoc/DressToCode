class RelatedS2c < ActiveRecord::Migration
  def change
    create_table :related_s2c do |t|
      t.integer :styles_id
      t.integer :category_id
      t.timestamps
    end
  end
end
