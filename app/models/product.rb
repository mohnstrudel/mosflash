class Product < ActiveRecord::Base
	belongs_to :category, :subcategory

end
