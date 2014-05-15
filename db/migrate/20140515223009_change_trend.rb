class ChangeTrend < ActiveRecord::Migration
  def change
    rename_table :trends, :styles
  end
end
