class RenameAttributeToProductAttribute < ActiveRecord::Migration
  def change

    rename_table :attributes, :product_attributes
  
  end
end
