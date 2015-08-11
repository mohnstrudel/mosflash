class Product < ActiveRecord::Base
	
	belongs_to	:category 
	belongs_to	:subcategory
	has_many	:options
	has_many	:voluminazations

	has_many	:volumes, through: :voluminazations

	accepts_nested_attributes_for :options

end
