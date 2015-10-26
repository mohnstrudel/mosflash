class LineItemsController < ApplicationController
	include CurrentCart
	include ApplicationHelper

	before_action	:find_cart, only: [:create]
	before_action	:set_line_item, only: [:show, :edit, :update, :destroy]

	def create
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id, params[:amount].to_f)
		
		if params[:addservices]
			@line_item.addservices = createHash(params[:addservices])
		end

		@line_item.sellprice = calculatePrice(params)

		# unless @line_item.sellprice
		# 	@line_item.sellprice = params[:line_item][:sellprice]
		# end
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

	def destroy
		if @line_item.destroy
	        respond_to do |format|
	            format.js
	            format.html { redirect_to @line_item.cart }
	            format.json { head :no_content }
	        end
	    end
	end

	# def sellprice
	# 	@line_item = LineItem.find(params[:id])
	# 	@line_item.sellprice = params[:line_item][:sellprice]
	# 	@line_item.save

	# 	respond_to do |format|
	# 		format.js
	# 		format.json { render json: @line_item.to_json(only: :sellprice) }
	# 	end
	# end

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
	    	
	    	paramHash = Hash.new

	    	parameters.each do |param|
	    		addserviceHash = Hash.new
	    		# Select additional services with given addservice id
	    		id = param.split(" ")[0].to_i
	    		addservice = Addservice.where(id: id)
	    		addservicePrice = param.split(" ")[1].to_f
	    		# Checking if there is a 'true' option that marks additional service that is
	    		# added only to a whole party of goods
	    		addserviceToParty = param.split(" ")[2]

	    		addserviceHash[:name] = addservice[0].title
	    		addserviceHash[:price] = addservicePrice
	    		addserviceHash[:toparty] = addserviceToParty

	    		paramHash[id] = addserviceHash
	    	end
	    	return paramHash
	    end

	    def calculatePrice(parameters)
	    	if parameters[:volume]
	    		basePrice = parameters[:volume].split(" ")[1].tr(']','').to_f
	    	else
	    		basePrice = crb_kurs(Product.find(parameters[:product_id]).basicprice)
	    	end
	    	amount = parameters[:amount].to_f
	    	amountCoefficient = getAmountCoefficient(amount)

	    	deliveryCoefficient = parameters[:delivery].to_f

	    	totalAmountWithoutAddservices = (basePrice * amountCoefficient * deliveryCoefficient)
	    	
	    	# partyServices = 0
	    	# eachServices = 0
	    	
	    	# line_item.addservices.each do |key, value|
	    	# 	if eval(value)[:toparty] == 'true'
	    	# 		partyServices += eval(value)[:price]
	    	# 	else
	    	# 		eachServices += eval(value)[:price]
	    	# 	end
	    	# end

	    	# additionalServices = [partyServices, eachServices]

	    	return totalAmountWithoutAddservices

	    end

	    def getAmountCoefficient(amount)

	    	case amount
	    	when 1..99
	    		return 1.5
	    	when 100..300
	    		return 1.4
	    	when 301..500
	    		return 1.3
	    	when 501..1000
	    		return 1.25
	    	when 1001..3000
	    		return 1.23
	    	when 3001..7000
	    		return 1.2
	    	end
	    end

end
