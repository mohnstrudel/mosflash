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
		@product.characteristics.build
		@product.additionalcharacteristics.build
		# @product.servizations.build
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			if params[:images]
				params[:images].each { |image| @product.images.create(image: image) }
			end
			redirect_to admin_products_path
			flash[:success] = "Успешно создано"
		else
			render action: :new
		end
	end

	def update
		if @product.update(product_params)
			if params[:images]
				params[:images].each { |image| @product.images.create(image: image) }
			end
			redirect_to edit_admin_product_path(@product)
			flash[:success] = "Успешно обновлено"
		else
			render action: :edit
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
			params.require(:product).permit(:title, :description, :advertising_text,
				:fancy_quote, :hot, :hotpic, :product_size_ids, :material, :basicprice,
				{ volume_ids: [] }, { color_ids: [] }, { addservice_ids: [] }, :category_id, :subcategory_id, 
				options_attributes: [:size, :weight, :price, :material, :product_id, :id, :_destroy],
				images_attributes: [ :id, :image, :product_id, :_destroy ],
				servizations_attributes: [:id, :product_id, :addservice_id, :coefficient],
				characteristics_attributes: [:id, :product_id, :weight, :length, :width, :thickness],
				additionalcharacteristics_attributes: [:id, :product_id, :name, :value]
				)
		end

		def find_product
			@product = Product.find(params[:id])
		end
end
