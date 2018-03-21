class RemoveTypeIdToItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :Type_id, :string
  end
end
