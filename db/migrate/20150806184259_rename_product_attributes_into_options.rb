class RenameProductAttributesIntoOptions < ActiveRecord::Migration
  def change
  	rename_table :product_attributes, :options
  end
end
