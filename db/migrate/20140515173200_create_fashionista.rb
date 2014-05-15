class CreateFashionista < ActiveRecord::Migration
  def change
    create_table :fashionista do |t|
      t.string :style
      t.string :size
      t.references :item

      t.timestamps
    end
  end
end
