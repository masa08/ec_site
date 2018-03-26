class AddItemCountToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :item_count, :integer
  end
end
