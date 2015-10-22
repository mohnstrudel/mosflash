class StoreFrontController < ApplicationController

	def index
		@products = Product.last(8)
		@hotProducts = Product.hot.order(sorting: :asc)
		@members = Member.all
	end

end
