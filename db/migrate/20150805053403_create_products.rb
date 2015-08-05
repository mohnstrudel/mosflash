class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :color
      t.string :size
      t.integer :weight
      t.string :material
      t.string :battery_type
      t.string :input
      t.string :output
      t.text :description
      t.string :usbchip
      t.string :interface
      t.string :supported_devices

      t.timestamps null: false
    end
  end
end
