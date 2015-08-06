class RemoveFieldsFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :color
    remove_column :products, :size
    remove_column :products, :weight
    remove_column :products, :material
    remove_column :products, :battery_type
    remove_column :products, :input
    remove_column :products, :output
    remove_column :products, :description
    remove_column :products, :usbchip
    remove_column :products, :interface
    remove_column :products, :supported_devices
  end
end
