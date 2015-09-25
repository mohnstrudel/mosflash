class ProductsController < ApplicationController
  
  before_action :find_product, only: [:show, :edit, :productSizes, :update]

  def show
    @getCurrency = Array.new

    @product.options.each do |option|
      @getCurrency << getCurrency(option.price)
    end
    @productSizes = productSizes
    @options = @product.options

    @randomProduct = youMayLike

    # Logic for the servizations
    @servizations = Array.new
    @product.servizations.each do |servization|
      @servizations << [servization, getCurrency(servization.coefficient * Addservice.find_by(id: servization.addservice_id).price)]
    end
    # render json: @product.to_json(include: :options)
  end

  def index
    if params[:category].blank?
      @products = Product.all.order("created_at DESC")
    else
      @category = Category.find_by(title: params[:category])
      @category_id = @category.id
      @products = Product.where(category_id: @category_id).order("created_at DESC")
    end 
    # render json: @products.to_json(include: :options)
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

  def update
    @product.update!(product_params)
    redirect_to @product
  end

  def hello(param)
    return param * 5
  end

  private

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
      # doc = Nokogiri::HTML(open("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=#{daterange}&date_req2=#{daterange}&VAL_NM_RQ=R01235"))

      doc = Nokogiri::HTML(open("http://www.cbr.ru/scripts/XML_daily_eng.asp?date_req=#{daterange}"))
      
      rateString = doc.xpath('//valcurs//valute[10]//value').inner_text   
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

    def productSizes
      volume = Array.new
      @product.options.each do |option|
        volume << Volume.where(id: option.size)
      end
      @volumes = volume
    end
end

