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

    def cartAddServiceValue
      resultArray = Array.new
      line_items.each_with_index do |li, index|
        resultArray << eval(li.addservices[(index+1).to_s]).fetch(:price).to_f
      end
      resultArray.sum
    end
        
end
