class StoreFrontController < ApplicationController

	def index
		@products = Product.last(8)
		@hotProducts = Product.hot
		@members = Member.all
	end

end
