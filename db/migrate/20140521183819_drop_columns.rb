class DropColumns < ActiveRecord::Migration
  def change
    remove_column :fashionistas, :type
    remove_column :fashionistas, :budget
  end
end
