class Feed < ActiveRecord::Migration
  def change
    create_table :feed do |t|
      t.string :type
      t.string :source
      t.string :uploaded_by
      t.integer :ftp_id
      t.string :is_active
      t.timestamps
    end
  end
end
