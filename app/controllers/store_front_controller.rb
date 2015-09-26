class StoreFrontController < ApplicationController

	def index
		@products = Product.last(10)
		@hotProducts = hotProduct
		@members = Member.all
		@setting = Setting.first
	end

	private

		def hotProduct
	      Product.where('hotpic IS NOT NULL')
	    end
end
