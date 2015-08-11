class ProductsController < ApplicationController
  
  before_action :find_product, only: [:show]

  def show
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

    if @product.save!
      flash[:success] = "Product successfully created!"
      redirect_to products_path
    end
  end

  private

  	def product_params
  		params.require(:product).permit(
        :title, :description, :advertising_text, :fancy_quote, :category_id, 
        options_attributes: [:size, :weight, :price, :material, :product_id, 
          option_pics_attributes: [:product_image, :option_id]])
  	end

  	def find_product
  		@product = Product.find(params[:id])
  	end
end

