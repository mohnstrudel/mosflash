class Product < ActiveRecord::Base

	scope :hot, lambda{ where.not(hotpic: nil) }

	validates :title, :advertising_text, presence: true
	validates :category_id, presence: true

	mount_uploader :hotpic, HotpicUploader
	mount_uploader :previewpic, PreviewpicUploader
	
	belongs_to	:category 
	belongs_to	:subcategory
	has_many	:options
	has_many	:additionalcharacteristics, dependent: :destroy
	has_many	:images, dependent: :destroy
	has_many	:hot_pics
	has_many	:line_items
	has_many	:makets

	has_many	:characteristics, dependent: :destroy

	has_many	:voluminazations
	has_many	:volumes, through: :voluminazations

	has_many	:colorizations
	has_many	:colors, through: :colorizations

	has_many	:accompanships
	has_many	:accompanies, through: :accompanships

	has_many	:servizations
	has_many	:addservices, through: :servizations

	has_many	:product_keywords
	has_many	:keywords, through: :product_keywords

	accepts_nested_attributes_for :options, allow_destroy: true

	accepts_nested_attributes_for :images, allow_destroy: true
	accepts_nested_attributes_for :additionalcharacteristics, allow_destroy: true
	accepts_nested_attributes_for :hot_pics
	accepts_nested_attributes_for :servizations
	accepts_nested_attributes_for :characteristics
	accepts_nested_attributes_for :makets, allow_destroy: true

	before_destroy	:ensure_not_referenced_by_any_line_item
	after_initialize :set_slug

	def init
		self.sorting ||= 500
	end

	def initialized_servizations # this is the key method
    [].tap do |o|
      Addservice.all.each do |addservice|
        if c = servizations.find { |c| c.addservice_id == addservice.id }
          o << c.tap { |c| c.enable ||= true }
        else
          o << Servization.new(addservice_id: addservice.id)
        end
      end
    end
end

	private

		def set_slug
			self.slug ||= Russian.translit(self.title).downcase.split(" ").join("-").to_s
		end

		# Ensure there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end

end
