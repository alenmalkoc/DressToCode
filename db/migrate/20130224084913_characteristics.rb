class Characteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.string :name
      t.timestamps
    end
  end
end
