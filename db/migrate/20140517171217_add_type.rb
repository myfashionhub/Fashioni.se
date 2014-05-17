class AddType < ActiveRecord::Migration
  def change
    add_column :fashionistas, :type, :string
  end
end
