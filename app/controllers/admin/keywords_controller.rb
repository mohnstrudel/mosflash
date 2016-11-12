class Admin::KeywordsController < AdminController
before_action	:find_keyword, only: [:edit, :update, :show, :destroy]

  def index
  	@keywords = Keyword.all
  end

  def show
  end

  def edit
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new(keyword_params)
    if @keyword.save
      redirect_to admin_keywords_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
    if @keyword.update(keyword_params)
      redirect_to admin_keywords_path
      flash[:success] = 'Успешно обновлено'
    end
  end

  def destroy
    if @keyword.destroy
      redirect_to admin_keywords_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_keyword
	  	@keyword = Keyword.find(params[:id])
	  end

	  def keyword_params
	  	params.require(:keyword).permit(:value)
	  end
end

