class RenameStatusIdColumnToHistories < ActiveRecord::Migration[5.1]
  def change
  	rename_column :histories, :status_id, :history_status_id
  end
end
