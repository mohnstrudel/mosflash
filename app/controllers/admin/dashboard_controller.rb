class Admin::DashboardController < ApplicationController
	def index
		@products = Product.last(5)
		@categories = Category.last(5)
		@subcategories = Subcategory.last(5)
		@volumes = Volume.last(5)
		@members = Member.last(5)
	end
end
