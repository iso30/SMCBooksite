class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id, foreign_key:true, index:true

      t.timestamps null: false
    end
  end
end
