class Category < ActiveRecord::Base
	has_many :products
	has_many :subcategories

	mount_uploader :avatar, AvatarUploader

	scope :flash, ->{where(title: 'Флешки')}
	scope :power_bank, ->{where(title: 'Power Bank')}
end
