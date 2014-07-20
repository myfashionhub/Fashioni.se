class CreateFashionistas < ActiveRecord::Migration
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
  end

  def down
    drop_table :fashionistas
  end
end
