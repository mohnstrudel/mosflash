class CreateProductSizes < ActiveRecord::Migration
  def change
    create_table :product_sizes do |t|
      t.integer :size

      t.timestamps null: false
    end
  end
end
