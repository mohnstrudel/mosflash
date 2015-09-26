class Admin::SettingsController < AdminController
	before_action	:find_setting, only: [:edit, :update, :show, :destroy]

  def index
  	@settings= Setting.all
  end

  def show
  end

  def edit
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to @setting
      flash[:success] = 'Успешно создано'
    end
  end

  def update
    if @setting.update!(setting_params)
      redirect_to edit_admin_setting_path(@setting)
      flash[:success] = 'Успешно обновлено'
    end
  end

  private

	  def find_setting
	  	@setting = Setting.find(params[:id])
	  end

	  def setting_params
	  	params.require(:setting).permit(:facebook, :vk, :instagram, :youtube)
	  end
end
