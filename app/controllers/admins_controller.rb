class AdminsController < ApplicationController
  def index
    @section = Section.find(params[:section_id])
    @admins = @section.admins
  end

  def new
    @section = Section.find(params[:section_id])
    @users = User.all
  end

  def create
    @section = Section.find(params[:section_id])
    @admin = @section.admins.create(admin_params)
    redirect_to @section
  end

  def destroy
    @section = Section.find(params[:section_id])
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to section_admins_path(@section)
  end

  private
    def admin_params
      params.require(:admin).permit(:admin_name, :section_id, :user_id)
    end
end
