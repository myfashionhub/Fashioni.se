class SavesTable < ActiveRecord::Migration
  def up
    create_table :saves do |t|
      t.integer :fashionista_id
      t.integer :item_id
      t.timestamps
    end
  end

  def down
    drop_table :saves
  end
end
