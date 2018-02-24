class CreateHistoryStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :history_statuses do |t|
      t.string :history_status_name

      t.timestamps
    end
  end
end
