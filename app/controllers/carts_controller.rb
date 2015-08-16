class CartsController < ApplicationController
	before_action :find_cart, only: [:show, :edit, :update, :destroy]
	
	def show
		
	end

	def new
    	@cart = Cart.new
	end

	def create

  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def find_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end
end
