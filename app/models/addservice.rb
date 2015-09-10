class Addservice < ActiveRecord::Base
	has_many :servizations
	has_many :products, through: :servizations
end
