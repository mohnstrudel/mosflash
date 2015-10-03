class Admin::ColorsController < AdminController
	before_action	:find_color, only: [:edit, :update, :show, :destroy]

  def index
  	@colors = Color.all
  end

  def show
  end

  def edit
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    if @color.save
      redirect_to admin_colors_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
    if @color.update(color_params)
      redirect_to admin_colors_path
      flash[:success] = 'Успешно обновлено'
    end
  end

  def destroy
    if @color.destroy
      redirect_to admin_colors_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_color
	  	@color = Color.find(params[:id])
	  end

	  def color_params
	  	params.require(:color).permit(:value, :csscolor)
	  end
end
