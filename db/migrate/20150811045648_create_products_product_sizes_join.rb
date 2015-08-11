class CreateProductsProductSizesJoin < ActiveRecord::Migration
  def change
    create_join_table :products, :product_sizes do |t|
    	t.index 'product_id'
    	t.index 'product_size_id'
    end
  end
end
