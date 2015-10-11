class RemoveUnnessesaryfieldsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :weight, :float
    remove_column :products, :length, :float
    remove_column :products, :width, :float
    remove_column :products, :thickness, :float
    remove_column :products, :avatar, :string
    remove_column :products, :size, :string
  end
end
