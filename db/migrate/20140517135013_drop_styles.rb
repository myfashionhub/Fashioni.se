class DropStyles < ActiveRecord::Migration
  def change
    drop_table :styles
  end
end
