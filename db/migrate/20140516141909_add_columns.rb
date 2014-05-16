class AddColumns < ActiveRecord::Migration
  def change
    add_column :fashionistas, :username, :string
    add_column :fashionistas, :tag_line, :string
    add_column :fashionistas, :budget, :string
    add_column :fashionistas, :pic_url, :string
  end
end
