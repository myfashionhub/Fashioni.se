class CreateFashionistas < ActiveRecord::Migration
  def change
    create_table :fashionistas do |t|
      t.string :style
      t.string :size
      t.references :item

      t.timestamps
    end
  end
end
