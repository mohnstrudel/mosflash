class Admin::VolumesController < AdminController
	before_action	:find_volume, only: [:edit, :update, :show, :destroy]

  def index
  	@volumes= Volume.all
  end

  def show
  end

  def edit
  end

  def new
    @volume = Volume.new
  end

  def create
    @volume = Volume.new(volume_params)
    if @volume.save
      redirect_to admin_volumes_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
    if @volume.update!(volume_params)
      redirect_to admin_volumes_path
      flash[:success] = 'Успешно обновлено'
    end
  end

  def destroy
    if @volume.destroy
      redirect_to admin_volumes_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_volume
	  	@volume = Volume.find(params[:id])
	  end

	  def volume_params
	  	params.require(:volume).permit(:value)
	  end

end
