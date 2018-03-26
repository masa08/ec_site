class RenameStatusColumnToHistories < ActiveRecord::Migration[5.1]
  def change
  	rename_column :histories, :status, :status_id
  end
end
