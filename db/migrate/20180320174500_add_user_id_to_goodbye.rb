class AddUserIdToGoodbye < ActiveRecord::Migration[5.1]
  def change
    add_column :goodbyes, :user_id, :string
  end
end
