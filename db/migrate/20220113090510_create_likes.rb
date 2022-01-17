class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :author, foreign_key: { to_table: 'users'}, null: false
      t.references :post, foreign_key: true, null: false
    end
  end
end
