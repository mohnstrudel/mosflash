class Volume < ActiveRecord::Base
	has_many :voluminazations
	has_many :products, through: :voluminazations
end
