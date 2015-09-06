class Color < ActiveRecord::Base
	has_many	:colorizations
	has_many	:products, through: :colorizations
end
