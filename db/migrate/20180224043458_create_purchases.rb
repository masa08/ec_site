class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :item_id
      t.integer :history_id

      t.timestamps
    end
  end
end
