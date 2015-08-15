class ProductsController < ApplicationController
  
  before_action :find_product, only: [:show]

  def show
    @randomProduct = randomProduct
    @product.options.each do |option|
      @getCurrency = getCurrency(option.price)
    end
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

    def getCurrency(dollars)
      # This code will take the Central Bank exchange rate for current date and apply it on the 
      # Rubles price on the product
      require 'nokogiri'
      require 'open-uri'
      
      daterange = DateTime.now.to_date.strftime("%d/%m/%Y")
      # Central Bank api does not accept single date value, thus, we're using twice the same day as range...
      # don't ask me why this isn't implemented
      doc = Nokogiri::HTML(open("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=#{daterange}&date_req2=#{daterange}&VAL_NM_RQ=R01235"))

      rateString = doc.xpath('//value').inner_text
      # Because there are commas in the float number divider we need to convert them into dots, because
      # a number with a comma is considered a string by Rails
      rate = rateString.gsub(/,/ , '.').to_f

      # Custom + 3% to the whole value
      priceInDollars = (dollars * rate) * 1.03

      # To show customer current exchange rate we return both, the exchange rate and the dollar price
      # additionally we'll add the original price aswell
      return priceInDollars, sprintf('%.3f', rate), dollars
    end

  	def find_product
  		@product = Product.find(params[:id])
  	end
end

