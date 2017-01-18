class Admin::CategoriesController < AdminController
  
  before_action	:find_category, only: [:edit, :update, :show]
  # after_filter :set_slug

  def index
  	@categories = Category.all
  end

  def show
  end

  def edit
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
  	if @category.update!(category_params)
  	   redirect_to admin_categories_path
       flash[:success] = 'Обновлено успешно'
    end
  end

  private

	  def find_category
	  	@category = Category.find(params[:id])
	  end

	  def category_params
	  	params.require(:category).permit(:title, :description, :avatar, :orderid, :slug)
	  end


end
