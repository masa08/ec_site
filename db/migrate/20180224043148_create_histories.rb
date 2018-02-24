class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :total_price
      t.string :status
      t.string :delivery_id
      t.string :payment_id
      t.text :send_address
      t.integer :send_postal_code
      t.string :send_name_kanji
      t.string :send_name_kana

      t.timestamps
    end
  end
end
