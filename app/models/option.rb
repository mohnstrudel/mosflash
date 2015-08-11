class Option < ActiveRecord::Base
	belongs_to	:product
	has_many	:option_pics

	accepts_nested_attributes_for :option_pics
end
