class SubcategoriesController < ApplicationController
  def show
  	Subcategory.find_by_name(params[:id])
  end
end
