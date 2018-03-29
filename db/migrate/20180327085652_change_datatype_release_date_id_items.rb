class ChangeDatatypeReleaseDateIdItems < ActiveRecord::Migration[5.1]
  def change
  	change_column :items, :release_date_id, :date
  end
end
