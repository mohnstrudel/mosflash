class ProductsController < ApplicationController
  
  before_action :find_product, only: [:show]

  def show
  end

  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
    @option = @product.options.new
  end

  def edit
  end

  def create
  	@product = Product.create(product_params)
    @option = @product.options.create(option_params)
    @option.product_id = @product.id
    @option.save
  	
    flash[:success] = "Product successfully created!"
  	redirect_to products_path
  end

  private

  	def product_params
  		params.require(:product).permit(:title, :description, :advertising_text, :fancy_quote)
  	end

    def option_params
      params.require(:option).permit(:size, :weight, :price, :material, :product_id)
    end

  	def find_product
  		@product = Product.find(params[:id])
  	end
end

