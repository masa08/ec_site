class ChangeDatatypeTypeIdOfItems < ActiveRecord::Migration[5.1]
  def change
  	change_column :items, :type_id, :integer
  end
end
