class AddCoefficientToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :coefficient, :float
  end
end
