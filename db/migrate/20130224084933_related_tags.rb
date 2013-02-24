class RelatedTags < ActiveRecord::Migration
  def change
    create_table :related_tags do |t|
      t.integer :tags_id
      t.integer :item_id
      t.timestamps
    end
  end
end
