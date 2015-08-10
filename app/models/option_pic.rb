class OptionPic < ActiveRecord::Base
	mount_uploader :product_image, ProductImageUploader
	belongs_to :option
end
