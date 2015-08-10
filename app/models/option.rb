class Option < ActiveRecord::Base
	belongs_to	:product
	has_many	:option_pics
end
