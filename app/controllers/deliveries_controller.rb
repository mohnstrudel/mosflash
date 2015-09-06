class DeliveriesController < ApplicationController
  
  before_action :find_delivery, only: [:show, :edit, :update]

  def index
    @deliveries = Delivery.all
  end

  def show
  end

  def edit
  end

  def update
    @delivery.update!(delivery_params)
    redirect_to @delivery 
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to @delivery
    else
      render new
    end
  end

  def new
    @delivery = Delivery.new
  end

  private

    def find_delivery
      @delivery = Delivery.find(params[:id])
    end

    def delivery_params
      params.require(:delivery).permit(:value)
    end
end
