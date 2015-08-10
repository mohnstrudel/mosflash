class RenameColumnForOptionPic < ActiveRecord::Migration
  def change
  	rename_column :option_pics, :image_url, :product_image
  end
end
