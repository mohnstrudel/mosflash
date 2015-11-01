class AddTotalsumToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :totalsum, :float
  end
end
