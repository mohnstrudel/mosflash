class Admin::ProductsController < AdminController
	def index
		@products = Product.all
	end

	def new
	  	@product = Product.new
	    option = @product.options.build
	    option_pic = option.option_pics.build
  	end

  	def create
	  	@product = Product.new(product_params)
	    if @product.save
	      redirect_to @product
	    end
	    # respond_to do |format|
	    #   if @product.save

	    #     format.html { redirect_to @product, notice: 'Product was successfully created.' }
	    #     format.json { render json: @product, status: :created, location: @product }
	    #   else
	    #     format.html { render action: "new" }
	    #     format.json { render json: @product.errors, status: :unprocessable_entity }
	    #   end
	    # end
  	end

  	def update
    	@product.update!(product_params)
    	redirect_to @product
  	end

  	private

  	def product_params
  		params.require(:product).permit(
        :title, :description, :advertising_text, :fancy_quote, :hot, :hotpic, :product_size_ids, 
        { volume_ids: [] }, { color_ids: [] }, { addservice_ids: [] }, :category_id, :subcategory_id, 
        options_attributes: [:size, :weight, :price, :material, :product_id],
        images_attributes: [ :image, :product_id ],
        servizations_attributes: [:id, :product_id, :addservice_id, :coefficient]
        )
  	end
end
