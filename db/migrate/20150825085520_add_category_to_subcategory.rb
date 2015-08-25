class AddCategoryToSubcategory < ActiveRecord::Migration
  def change
    add_reference :subcategories, :category, index: true
    add_foreign_key :subcategories, :categories
  end
end
