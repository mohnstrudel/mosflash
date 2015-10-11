class Admin::BlogpostsController < AdminController
	before_action	:find_blogpost, only: [:edit, :update, :show, :destroy]

  def index
  	@blogposts= Blogpost.all
  end

  def show
  end

  def edit
  end

  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = Blogpost.new(blogpost_params)
    if @blogpost.save
      redirect_to admin_blogposts_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
    if @blogpost.update(blogpost_params)
      redirect_to admin_blogposts_path
      flash[:success] = 'Успешно обновлено'
    end
  end

  def destroy
    if @blogpost.destroy
      redirect_to admin_blogposts_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_blogpost
	  	@blogpost = Blogpost.find(params[:id])
	  end

	  def blogpost_params
	  	params.require(:blogpost).permit(:title, :body, :author, :leadparagraph)
	  end
end
