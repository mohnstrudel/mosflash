class AddSizefieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :weight, :float
    add_column :products, :length, :float
    add_column :products, :width, :float
    add_column :products, :thickness, :float
  end
end
