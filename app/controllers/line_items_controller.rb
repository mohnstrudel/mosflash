class LineItemsController < ApplicationController
	include CurrentCart
	before_action	:find_cart, only: [:create]
	before_action	:set_line_item, only: [:show, :edit, :update, :destroy]

	def create
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id, params[:amount].to_f)
		if @line_item.addservices
			@line_item.addservices = createHash(params[:addservices])
		end

		unless @line_item.sellprice
			@line_item.sellprice = params[:line_item][:sellprice]
		end
		respond_to do |format|
			if @line_item.save
				format.html { redirect_to @line_item.cart, notice: 'Продукт успешно добавлен.'}
				# format.json { render json: @line_item.to_json, status: :created, location: @line_item}
				format.json { render json: @line_item.to_json }
				format.js
			else
				format.html { render action: 'new' }
				format.json { render json: @line_item.errors, status: :unprocessable_entity }
			end
		end
	end

	def sellprice
		@line_item = LineItem.find(params[:id])
		@line_item.sellprice = params[:line_item][:sellprice]
		@line_item.save

		respond_to do |format|
			format.js
			format.json { render json: @line_item.to_json(only: :sellprice) }
		end
	end

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_line_item
	      @line_item = LineItem.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def line_item_params
	      params.require(:line_item).permit(:product_id, :cart_id, :quantity, :sellprice)
	    end

	    def createHash(parameters)
	    	addserviceHash = Hash.new
	    	paramHash = Hash.new

	    	parameters.each do |param|
	    		# Select additional services with given addservice id
	    		id = param.split(" ")[0].to_i
	    		addservice = Addservice.where(id: id)
	    		addservicePrice = param.split(" ")[1].to_f
	    		addserviceHash[:name] = addservice[0].title
	    		addserviceHash[:price] = addservicePrice
	    		paramHash[id] = addserviceHash
	    	end
	    	return paramHash
	    end
end
