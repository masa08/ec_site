class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name_kanji
      t.string :user_name_kana
      t.text :address
      t.integer :postal_code
      t.integer :phone_number
      t.text :mail_address
      t.string :password
      t.integer :cart_id

      t.timestamps
    end
  end
end
