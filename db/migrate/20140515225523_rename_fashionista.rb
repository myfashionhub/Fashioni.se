class RenameFashionista < ActiveRecord::Migration
  def change
    rename_table :fashionista, :fashionistas
  end
end
