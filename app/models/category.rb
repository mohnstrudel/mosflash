class Category < ActiveRecord::Base
	has_many :products
	has_many :subcategories

	mount_uploader :avatar, AvatarUploader

	scope :flash, ->{where(title: 'Флешки')}
	scope :power_bank, ->{where(title: 'Power Bank')}

	after_initialize :set_slug

	def set_slug
		self.slug ||= Russian.translit(self.title).downcase.split(" ").join("-").to_s
	end

	def to_param
		slug
	end
end
