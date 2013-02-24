class Dresscodes < ActiveRecord::Migration
  def change
    create_table :dress_codes do |t|
      t.string :name
      t.timestamps
    end
  end
end
