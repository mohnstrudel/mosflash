class AddBasicpriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :basicprice, :float
  end
end
