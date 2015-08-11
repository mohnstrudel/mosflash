class ChangeColumnNameForOptionPics < ActiveRecord::Migration
  def change
  	rename_column :option_pics, :product_images, :product_image
  end
end
