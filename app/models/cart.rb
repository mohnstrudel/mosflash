class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id, quantity)
  		current_item = line_items.find_by(product_id: product_id)
  		if current_item
  			current_item.quantity += quantity
  		else
  			current_item = line_items.build(product_id: product_id, quantity: quantity)
        # I don't know why exactly, but if there is no item, your first addition
        # to the cart will always put in #itemcount + 1 into the cart. Hence, the substraction.
        # current_item.quantity -= 1
  		end
  		current_item
  	end

  	def cartValue
  		line_items.to_a.sum { |item| item.totalPrice}
  	end

    def cartAddServiceValue
      # this method is called in the order summary partial to add up all additional services
      resultArrayEach = Array.new
      resultArrayParty = Array.new
      result = 0

      line_items.each_with_index do |li, index|
        if li.addservices?
          li.addservices.each do |key, value|
            if eval(value).fetch(:toparty) == nil
              resultArrayEach << eval(value).fetch(:price)
            else
              resultArrayParty << eval(value).fetch(:price)
            end
          end
        end

        result = resultArrayEach.sum * li.quantity + resultArrayParty.sum
      end

      return result
    end
        
end
