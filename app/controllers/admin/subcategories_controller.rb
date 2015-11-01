class Admin::SubcategoriesController < AdminController
	before_action	:find_subcategory, only: [:edit, :update, :show]

  def index
  	@subcategories = Subcategory.all
  end

  def show
  end

  def edit
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      redirect_to admin_subcategories_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
  	if @subcategory.update(subcategory_params)
      redirect_to admin_subcategories_path
      flash[:success] = 'Успешно обновлено'
    end
  end

  def destroy
    if @subcategory.destroy
      redirect_to admin_subcategories_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_subcategory
	  	@subcategory = Subcategory.find(params[:id])
	  end

	  def subcategory_params
	  	params.require(:subcategory).permit(:id, :title, :description, :category_id, :avatar)
	  end

end
