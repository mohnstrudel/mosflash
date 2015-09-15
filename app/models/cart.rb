class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id, quantity)
  		current_item = line_items.find_by(product_id: product_id)
  		if current_item
  			current_item.quantity += quantity
  		else
  			current_item = line_items.build(product_id: product_id)
  		end
  		current_item
  	end

  	def cartValue
  		line_items.to_a.sum { |item| item.totalPrice}
  	end
end
