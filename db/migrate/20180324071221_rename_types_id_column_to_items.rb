class RenameTypesIdColumnToItems < ActiveRecord::Migration[5.1]
  def change
  	    rename_column :items, :types_id, :type_id
  end
end
