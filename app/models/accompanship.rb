class Accompanship < ActiveRecord::Base
	belongs_to	:product
	belongs_to	:accompany, class_name: "Product"
end
