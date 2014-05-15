class CreateFashionista < ActiveRecord::Migration
  def change
    create_table :fashionista do |t|
      t.string :Trend

      t.timestamps
    end
  end
end
