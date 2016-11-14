class StoreFrontController < ApplicationController

	def index
		@products = Product.last(8)
		@hotProducts = Product.hot.order(sorting: :asc)
		@members = Member.all
		@fleshki_category = Category.flash[0]
		@power_bank_category = Category.power_bank[0]

	end

end
