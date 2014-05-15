class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.string :description
      t.string :size
      t.references :fashionista
      t.references :trend
      t.timestamps
    end
  end
end
