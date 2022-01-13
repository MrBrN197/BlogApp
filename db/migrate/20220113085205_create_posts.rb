class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.string :text
      t.integer :comments_counter
      t.integer :likes_counter

      t.references :author, foreign_key: { to_table: 'users'}

      t.timestamps
    end
  end
end