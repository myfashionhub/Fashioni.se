class AddColStyle < ActiveRecord::Migration
  def change
    add_column :styles, :store_hash, :string
  end
end
