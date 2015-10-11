class Admin::AccompanshipsController < AdminController
  def create
  	@accompanship = Product.find(params[:product_id]).accompanships.build(accompany_id: params[:accompany_id])
  	if @accompanship.save
  		flash[:notice] = "Successfully created accompanship"
  		redirect_to edit_admin_product_path(params[:product_id])
  	else
  		render action: 'new'
  	end
  end

  def destroy
  end

  private

end
