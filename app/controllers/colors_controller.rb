class ColorsController < ApplicationController

	before_action	:find_color, only: [:show]
	def index
		@colors = Color.all
	end

	def new
		@color = Color.new
	end

	def create
		@color = Color.new(color_params)
		if @color.save
			redirect_to colors_path
		else
			render new
		end
	end


	private

		def find_color
			@color = Color.find(params[:id])
		end

		def color_params
			params.require(:color).permit(:value)
		end
end
