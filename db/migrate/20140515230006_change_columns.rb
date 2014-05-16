class ChangeColumns < ActiveRecord::Migration
  def change
    remove_column :fashionistas, :style, :string
    add_column :fashionistas, :style_id, :integer
    rename_column :items, :trend_id, :style_id  
    add_column :styles, :fashionista_id, :integer  
  end
end
