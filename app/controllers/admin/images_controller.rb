class Admin::ImagesController < AdminController
	def create
		@image = Image.new(image_params)
		@image.save
	end

	private

	def image_params
		params.require(:image).permit(:id, :image, :product_id)
	end
end
