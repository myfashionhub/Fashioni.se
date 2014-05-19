class RenamePassword < ActiveRecord::Migration
  def change
    rename_column :fashionistas, :password, :password_digest
  end
end
