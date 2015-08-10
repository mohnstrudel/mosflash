class Product < ActiveRecord::Base

	mount_uploader :avatar, AvatarUploader
	
	belongs_to	:category 
	belongs_to	:subcategory
	has_many	:options

end
