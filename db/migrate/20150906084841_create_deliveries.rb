class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :value

      t.timestamps null: false
    end
  end
end
