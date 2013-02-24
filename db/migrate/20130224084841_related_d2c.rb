class RelatedD2c < ActiveRecord::Migration
  def change
    create_table :related_d2c do |t|
      t.integer :dresscode_id
      t.integer :category_id
      t.timestamps
    end
  end
end
