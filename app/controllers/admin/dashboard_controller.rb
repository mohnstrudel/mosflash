class Admin::DashboardController < AdminController
	def index
		@products = Product.last(5)
		@categories = Category.last(5)
		@subcategories = Subcategory.last(5)
		@volumes = Volume.last(5)
		@members = Member.last(5)
		@addservices = Addservice.last(5)
		@setting = Setting.first
		@deliveries = Delivery.last(5)
	end
end
