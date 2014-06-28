class StylesTable < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.name :string
      t.timestamps
    end
  end
end
