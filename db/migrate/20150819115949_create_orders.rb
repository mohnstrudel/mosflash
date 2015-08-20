class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :fname
      t.string :lname
      t.string :company
      t.string :street
      t.string :city
      t.string :zip
      t.string :phone
      t.string :mail
      t.string :pay_type
      t.string :delivery_type

      t.timestamps null: false
    end
  end
end
