class Keyword < ActiveRecord::Base

	has_many :product_keywords
	has_many :products, through: :product_keywords
end
