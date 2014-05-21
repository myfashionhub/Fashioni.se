class AddShopstyleId < ActiveRecord::Migration
  def change
    add_column :items, :shopstyle_id, :integer
  end
end
