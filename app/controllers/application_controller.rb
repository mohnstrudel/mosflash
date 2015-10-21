class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  include CurrentCart

  protect_from_forgery with: :exception

  before_action	:youMayLike	
  before_action :find_cart
  
	def youMayLike
	    @randomProduct = Product.limit(3).order("RANDOM()")
	end
end
