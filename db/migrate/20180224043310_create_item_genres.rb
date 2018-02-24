class CreateItemGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :item_genres do |t|
      t.integer :item_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
