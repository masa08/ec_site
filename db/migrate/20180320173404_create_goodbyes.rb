class CreateGoodbyes < ActiveRecord::Migration[5.1]
  def change
    create_table :goodbyes do |t|
      t.text :reason

      t.timestamps
    end
  end
end
