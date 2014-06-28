class ItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.url :string
      t.image_url :text
      t.description :string
      t.price :string
      t.shopstyle_id :integer
      t.style_id :integer
      t.timestamps
    end
  end
end
