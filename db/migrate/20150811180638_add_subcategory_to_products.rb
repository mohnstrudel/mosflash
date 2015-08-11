class AddSubcategoryToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :subcategory, index: true
    add_foreign_key :products, :subcategories
  end
end
