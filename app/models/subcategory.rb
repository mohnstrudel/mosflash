class Subcategory < ActiveRecord::Base
	has_many :products
	belongs_to	:category

	mount_uploader :avatar, AvatarUploader
end
