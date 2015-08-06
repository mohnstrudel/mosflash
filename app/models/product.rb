class Product < ActiveRecord::Base
	belongs_to	:category 
	belongs_to	:subcategory
	has_many	:product_attributes

end
