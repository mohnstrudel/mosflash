class OptionsController < ApplicationController
	def index
	end

	def create
		@product = Product.find(params[:product_id])

		@option = @product.options.create(option_params)
		@option.product_id = @product.id

		@option.save

	end

	private
		def option_params
			params.require(:option).permit(:size, :weight, :price, :material, :product_id)
		end
end
