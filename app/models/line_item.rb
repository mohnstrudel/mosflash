class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def totalPrice
  	self.sellprice * quantity
  end

  def calculateAdditionalServices(line_item)
	  # this method is called in the order summary partial to add up all additional services
	  resultArrayEach = Array.new
	  resultArrayParty = Array.new
	  result = 0

	  if line_item.addservices?
	      line_item.addservices.each do |key, value|
	        if eval(value).fetch(:toparty) == nil
	          resultArrayEach << eval(value).fetch(:price)
	        else
	          resultArrayParty << eval(value).fetch(:price)
	        end
	      end
	  end

	  result = resultArrayEach.sum * line_item.quantity + resultArrayParty.sum
	  

	  return result
    end
end
