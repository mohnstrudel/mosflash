class AddProductsToHotpics < ActiveRecord::Migration
  def change
    add_reference :hot_pics, :product, index: true
    add_foreign_key :hot_pics, :products
  end
end
