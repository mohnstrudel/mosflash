class CategoriesController < ApplicationController
  before_action	:find_category, only: [:edit, :update, :show]

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
      redirect_to @category
    end
  end

  def update
  	@category.update!(category_params)
  	redirect_to @category
  end

  private

	  def find_category
	  	@category = Category.find(params[:id])
	  end

	  def category_params
	  	params.require(:category).permit(:title, :description, :avatar)
	  end

end
