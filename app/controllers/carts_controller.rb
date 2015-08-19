class CartsController < ApplicationController
	before_action :find_cart, only: [:show, :edit, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
	
	def show
	end

	def new
    	@cart = Cart.new
	end

	def create

  	end

  	def destroy
  		@cart.destroy if @cart.id == session[:cart_id]
  		session[:cart_id] = nil

  		respond_to do |format|
  			format.html { redirect_to root_path, notice: 'Ваша корзина на данный момент пуста'}
  			format.json { head :no_content }
  		end
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

	def invalid_cart
		logger.error "Attempt to access invalid cart #{params[:id]}"
		redirect_to root_path, notice: 'Неизвестная корзина'
	end
end
