class EditItems < ActiveRecord::Migration
  def change
    rename_column :items, :type, :image_url
    rename_column :items, :size, :url
    add_column :items, :price, :string
  end
end
