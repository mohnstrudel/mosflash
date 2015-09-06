class Product < ActiveRecord::Base

	mount_uploader :hotpic, HotpicUploader
	
	belongs_to	:category 
	belongs_to	:subcategory
	has_many	:options
	has_many	:images, dependent: :destroy
	has_many	:hot_pics
	has_many	:line_items

	has_many	:voluminazations
	has_many	:volumes, through: :voluminazations

	has_many	:colorizations
	has_many	:colors, through: :colorizations

	has_many	:accompanships
	has_many	:accompanies, through: :accompanships

	accepts_nested_attributes_for :options
	accepts_nested_attributes_for :images
	accepts_nested_attributes_for :hot_pics

	before_destroy	:ensure_not_referenced_by_any_line_item

	private

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
