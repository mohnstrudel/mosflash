class Subcategory < ActiveRecord::Base
	has_many :products
	belongs_to	:category

	mount_uploader :avatar, AvatarUploader

	after_initialize :set_slug

	def set_slug
		self.slug ||= Russian.translit(self.title).downcase.split(" ").join("-").to_s
	end
end
