class CreateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :types do |t|
      t.string :category_name

      t.timestamps
    end
  end
end
