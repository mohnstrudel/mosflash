class ProductsController < ApplicationController
  
  before_action :find_product, only: [:show]

  def show
    @randomProduct = randomProduct
  end

  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
    option = @product.options.build
    option_pic = option.option_pics.build
  end

  def edit
  end

  def create
  	@product = Product.new(product_params)

    respond_to do |format|
      if @product.save

        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def randomProduct
      lastID = Product.last.id
      randomID = rand(lastID)
      Product.find(randomID)
    end

  	def product_params
  		params.require(:product).permit(
        :title, :description, :advertising_text, :fancy_quote, :product_size_ids, { volume_ids: [] }, :category_id, :subcategory_id, 
        options_attributes: [:size, :weight, :price, :material, :product_id],
        images_attributes: [ :image, :product_id ] 
        )
  	end

    # def product_params
    #   params.require(:product).permit!
    # end

  	def find_product
  		@product = Product.find(params[:id])
  	end
end

