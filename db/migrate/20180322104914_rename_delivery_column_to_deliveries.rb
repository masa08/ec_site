class RenameDeliveryColumnToDeliveries < ActiveRecord::Migration[5.1]
  def change
  	rename_column :deliveries, :delivery, :sipping
  end
end
