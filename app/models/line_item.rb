class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def totalPrice
  	product.options.first.price * quantity
  end
end
