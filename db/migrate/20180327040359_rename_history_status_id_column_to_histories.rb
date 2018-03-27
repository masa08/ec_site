class RenameHistoryStatusIdColumnToHistories < ActiveRecord::Migration[5.1]
  def change
  	rename_column :histories, :history_status_id, :status_id
  end
end
