class CreateItemCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :item_carts do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :item_count

      t.timestamps
    end
  end
end
