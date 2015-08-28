class Product < ActiveRecord::Base
	
	belongs_to	:category 
	belongs_to	:subcategory
	has_many	:options
	has_many	:voluminazations
	has_many	:images
	has_many	:line_items

	has_many	:volumes, through: :voluminazations

	has_many	:accompanships
	has_many	:accompanies, through: :accompanships

	accepts_nested_attributes_for :options
	accepts_nested_attributes_for :images

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
