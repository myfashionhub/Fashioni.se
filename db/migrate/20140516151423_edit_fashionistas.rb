class EditFashionistas < ActiveRecord::Migration
  def change
    rename_column :fashionistas, :tag_line, :tagline
    add_column :fashionistas, :email, :string
    add_column :fashionistas, :password, :string
  end
end
