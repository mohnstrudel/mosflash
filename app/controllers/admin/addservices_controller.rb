class Admin::AddservicesController < AdminController
	before_action	:find_addservice, only: [:edit, :update, :show, :destroy]

  def index
  	@addservices = Addservice.all
  end

  def show
  end

  def edit
  end

  def new
    @addservice = Addservice.new
  end

  def create
    @addservice = Addservice.new(addservice_params)
    if @addservice.save
      redirect_to admin_addservices_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
  	if @addservice.update!(addservice_params)
  		redirect_to admin_addservices_path
     	flash[:success] = 'Успешно обновлено'
     end
  end

  def destroy
    if @addservice.destroy
      redirect_to admin_addservices_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_addservice
	  	@addservice = Addservice.find(params[:id])
	  end

	  def addservice_params
	  	params.require(:addservice).permit(:title, :price)
	  end
end
