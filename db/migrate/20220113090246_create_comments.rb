class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :author, foreign_key: {to_table: 'users'}
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
