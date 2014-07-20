class ItemsTable < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :url
      t.text :image_url
      t.string :description
      t.string :price
      t.integer :shopstyle_id
      t.integer :style_id
      t.timestamps
    end
  end

  def down
    drop_table :items
  end
end
