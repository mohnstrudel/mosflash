class Admin::ProductsController < AdminController
	
	before_action	:find_product, only: [:edit, :destroy, :update]

	def index
		@products = Product.all
	end

	def edit
	end

	def new
		@product = Product.new
		option = @product.options.build
		option_pic = option.option_pics.build
		@product.servizations.build
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_products_path
			flash[:success] = "Успешно создано"
		else
			render new
		end
	end

	def update
		if @product.update!(product_params)
			redirect_to admin_products_path
			flash[:success] = "Успешно обновлено"
		else
			render edit
		end
	end

	def destroy
		if @product.destroy
			redirect_to admin_products_path
			flash[:info] = 'Удалено успешно'
		end
    end

	private

		def product_params
			params.require(:product).permit(:title, :description, :advertising_text, :fancy_quote, :hot, :hotpic, :product_size_ids, 
				{ volume_ids: [] }, { color_ids: [] }, { addservice_ids: [] }, :category_id, :subcategory_id, 
				options_attributes: [:size, :weight, :price, :material, :product_id, :id],
				images_attributes: [ :image, :product_id ],
				servizations_attributes: [:id, :product_id, :addservice_id, :coefficient]
				)
		end

		def find_product
			@product = Product.find(params[:id])
		end
end
