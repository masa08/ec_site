class AddCartIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cart_id, :integer
    add_column :users, :user_name_kanji, :string
    add_column :users, :user_name_kana, :string
    add_column :users, :address, :text
    add_column :users, :postal_code, :string
    add_column :users, :phone_number, :string
  end
end
