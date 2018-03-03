class ChangeDatatypeJacketImageIdOfItems < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :jacket_image_id, :text
  end
end
