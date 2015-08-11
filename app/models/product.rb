class Product < ActiveRecord::Base
	
	belongs_to	:category 
	belongs_to	:subcategory
	has_many	:options

	has_and_belongs_to_many :product_sizes

	accepts_nested_attributes_for :options

end
