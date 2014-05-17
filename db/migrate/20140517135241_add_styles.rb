class AddStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.references :fashionista
      t.references :item
    end  
  end
end
