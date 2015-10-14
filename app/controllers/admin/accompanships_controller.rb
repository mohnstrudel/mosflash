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
    @accompanship = Accompanship.where(accompany_id: params[:accompany_id]).where(product_id: params[:product_id])
    if @accompanship[0].destroy
      flash[:info] = "Успешно удалено"
      redirect_to edit_admin_product_path(params[:product_id])
    else
      render action: 'edit'
    end
  end


end
