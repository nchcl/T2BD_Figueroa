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
      redirect_to @section
    else
      render 'new'
    end
  end

  def destroy
    @user = current_user
    @section = @user.sections.find(params[:id])
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def section_params
      params.require(:section).permit(:section_name, :user_id, :created_date)
    end
end
