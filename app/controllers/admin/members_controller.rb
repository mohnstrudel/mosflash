class Admin::MembersController < AdminController
	before_action	:find_member, only: [:edit, :update, :show, :destroy]

  def index
  	@members= Member.all
  end

  def show
  end

  def edit
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to admin_members_path
      flash[:success] = 'Успешно создано'
    end
  end

  def update
    if @member.update!(member_params)
      redirect_to admin_members_path
      flash[:success] = 'Успешно обновлено'
    end
  end

  def destroy
    if @member.destroy
      redirect_to admin_members_path
      flash[:info] = 'Удалено успешно'
    end
  end

  private

	  def find_member
	  	@member = Member.find(params[:id])
	  end

	  def member_params
	  	params.require(:member).permit(:name, :description, :position, :mail, :calling, :cite)
	  end
end
