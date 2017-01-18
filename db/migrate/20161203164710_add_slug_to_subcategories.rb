class AddSlugToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :slug, :string
  end
end
