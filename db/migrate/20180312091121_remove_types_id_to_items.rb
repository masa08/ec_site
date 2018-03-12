class RemoveTypesIdToItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :Types_id, :string
  end
end
