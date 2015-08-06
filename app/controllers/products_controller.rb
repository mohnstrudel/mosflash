class ProductsController < ApplicationController
  
  before_action :find_product, only: [:show]

  def show
  end

  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def edit
  end

  def create
  	@product = Product.create(product_params)
  	flash[:success] = "Product successfully created!"
  	redirect_to products_path
  end

  private

  	def product_params
  		params.require(:product).permit(:title, :description)
  	end

  	def find_product
  		@product = Product.find(params[:id])
  	end
end

