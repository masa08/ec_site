class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :stock
      t.string :artist_name
      t.integer :jacket_image_id
      t.integer :price
      t.string :label
      t.integer :item_status_id
      t.integer :release_date_id

      t.timestamps
    end
  end
end
