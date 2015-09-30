class StoreFrontController < ApplicationController

	def index
		@products = Product.last(8)
		@hotProducts = hotProduct
		@members = Member.all
	end

	private

		def hotProduct
	      Product.where('hotpic IS NOT NULL')
	    end
end
