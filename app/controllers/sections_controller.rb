class SectionsController < ApplicationController

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @user = current_user
    @section = @user.sections.build
  end

  def create
    @user = current_user
    @section = @user.sections.build(section_params)

    if @section.save
      Admin.create(admin_name: @user.username, user_id: @user.id, section_id: @section.id)
      redirect_to @section
    else
      render 'new'
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to sections_url
  end

  private
    def section_params
      params.require(:section).permit(:section_name, :user_id, :created_date)
    end
end
