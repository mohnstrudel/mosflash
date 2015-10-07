class Product < ActiveRecord::Base

	validates :title, :advertising_text, presence: true
	validates :category_id, :subcategory_id, presence: true

	mount_uploader :hotpic, HotpicUploader
	
	belongs_to	:category 
	belongs_to	:subcategory
	has_many	:options
	has_many	:additionalcharacteristics
	has_many	:images, dependent: :destroy
	has_many	:hot_pics
	has_many	:line_items

	has_many	:characteristics, dependent: :destroy

	has_many	:voluminazations
	has_many	:volumes, through: :voluminazations

	has_many	:colorizations
	has_many	:colors, through: :colorizations

	has_many	:accompanships
	has_many	:accompanies, through: :accompanships

	has_many	:servizations
	has_many	:addservices, through: :servizations

	accepts_nested_attributes_for :options, allow_destroy: true

	accepts_nested_attributes_for :images, allow_destroy: true
	accepts_nested_attributes_for :additionalcharacteristics, allow_destroy: true
	accepts_nested_attributes_for :hot_pics
	accepts_nested_attributes_for :servizations
	accepts_nested_attributes_for :characteristics

	before_destroy	:ensure_not_referenced_by_any_line_item

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
