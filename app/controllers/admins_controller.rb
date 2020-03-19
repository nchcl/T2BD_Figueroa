class AdminsController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @users = User.all
  end

  def create
    @section = Section.find(params[:section_id])
    @admin = @section.admins.create(admin_params)
    redirect_to @section
  end

  private
    def admin_params
      params.require(:admin).permit(:admin_name, :section_id, :user_id)
    end
end
