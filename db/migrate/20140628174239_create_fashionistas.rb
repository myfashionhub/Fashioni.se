class CreateFashionistas < ActiveRecord::Migration[5.1]
  def up
    create_table :fashionistas do |t|
      t.string :username
      t.string :email
      t.string :size
      t.integer :style_id
      t.string :tagline
      t.string :pic_url
      t.string :password_digest
      t.timestamps
    end

    create_table :items do |t|
      t.string :url
      t.text :image_url
      t.string :description
      t.string :price
      t.integer :shopstyle_id
      t.integer :style_id
      t.timestamps
    end

    create_table :saves do |t|
      t.integer :fashionista_id
      t.integer :item_id
      t.timestamps
    end

    create_table :styles do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :fashionistas
    drop_table :items
    drop_table :saves
    drop_table :styles
  end
end
