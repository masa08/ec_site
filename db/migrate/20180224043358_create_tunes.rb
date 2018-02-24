class CreateTunes < ActiveRecord::Migration[5.1]
  def change
    create_table :tunes do |t|
      t.integer :item_id
      t.string :tune_title

      t.timestamps
    end
  end
end
