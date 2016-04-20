class ProductsController < ApplicationController
  
  before_action :find_product, only: [:show, :edit, :productSizes, :update]

  def show
    @getCurrency = Array.new
    @volumes = Array.new
    @options = @product.options

    unless @product.basicprice
      @product.options.each do |option|
        @getCurrency << getCurrency(option.price)
        # Here we get volumes as readable MB format, because option.size is just 1, 2, 3 etc
        @volumes << Volume.where(id: option.size.to_i)
      end
      @initialPrice = initialPrice(@options.first.price)
    end
    @productSizes = productSizes
    


    
    
    @randomProduct = youMayLike

    # Logic for the servizations
    if @product.addservices.any?
      @servizations = Array.new
      @product.servizations.each do |servization|
        if servization.addservice_id
          @servizations << [servization, servization.coefficient * Addservice.find_by(id: servization.addservice_id).price]
        end
      end
    end
    # render json: @product.to_json(include: :options)
  end

  def index

    @members = Member.all

    @per_page = params[:per_page] || Product.per_page || 20
    if params[:category].blank?
      @products = Product.all.order(params[:sort], created_at: :desc).paginate(:per_page => @per_page, :page => params[:page])
    elsif params[:subcategory].blank?
      @category = Category.find_by(title: params[:category])
      @category_id = @category.id
      if params[:sort]
        @products = Product.where(category_id: @category_id).order(params[:sort, created_at: :desc]).paginate(:per_page => @per_page, :page => params[:page])
      else
        @products = Product.where(category_id: @category_id).order(params[created_at: :desc]).paginate(:per_page => @per_page, :page => params[:page])
      end

    else

      @category = Category.find_by(title: params[:category])
      @category_id = @category.id
      @subcategory = Subcategory.find_by(title: params[:subcategory])
      @subcategory_id = @subcategory.id

      if params[:sort]
        @products = Product.where(category_id: @category_id).where(subcategory_id: @subcategory_id).order(params[:sort, created_at: :desc]).paginate(:per_page => @per_page, :page => params[:page])
      else
        @products = Product.where(category_id: @category_id).where(subcategory_id: @subcategory_id).order(params[created_at: :desc]).paginate(:per_page => @per_page, :page => params[:page])
      end

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

    def initialPrice(dollars)
      rubles = getCurrency(dollars)[0]

      amountMultiplier = 1.5
      amountDelivery = Delivery.all.order(coefficient: :asc).first.coefficient
      return rubles * amountMultiplier * amountDelivery
    end

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

