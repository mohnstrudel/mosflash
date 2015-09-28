class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def totalPrice
  	self.sellprice * quantity
  end
end
