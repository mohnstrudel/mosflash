class Admin::DeliveriesController < AdminController
	before_action	:find_delivery, only: [:edit, :update, :show, :destroy]

  def index
  	@deliveries= Delivery.all
  end

  def show
  end

  def edit
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to admin_deliveries_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
    if @delivery.update!(delivery_params)
      redirect_to admin_deliveries_path
      flash[:success] = 'Успешно обновлено'
    end
  end

  def destroy
    if @delivery.destroy
      redirect_to admin_deliveries_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_delivery
	  	@delivery = Delivery.find(params[:id])
	  end

	  def delivery_params
	  	params.require(:delivery).permit(:value)
	  end
end
