class CreateFashionistas < ActiveRecord::Migration
  def change
    create_table :fashionistas do |t|
      t.username :string
      t.email :string
      t.size :string
      t.style_id :integer
      t.tagline :string
      t.pic_url :string
      t.password_digest :string
      t.timestamps
    end
  end
end
