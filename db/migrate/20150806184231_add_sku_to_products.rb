class AddSkuToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sku, :integer
  end
end
