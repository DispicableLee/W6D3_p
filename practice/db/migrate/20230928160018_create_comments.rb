class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :artwork, null: false, foreign_key: {to_table: :artworks}
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.string :body
      t.timestamps
    end
  end
end
