class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :micropost_id, null: false

      t.timestamps
    end
    add_index :favorites, :micropost_id
    add_index :favorites, [:user_id, :micropost_id], unique: true
  end
end
