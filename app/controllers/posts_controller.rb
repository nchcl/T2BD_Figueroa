class PostsController < ApplicationController

  def show
    @section = Section.find(params[:section_id])
    @post = @section.posts.find(params[:id])
  end

  def create
    @section = Section.find(params[:section_id])
    @post = @section.posts.create(post_params)
    redirect_to @section
  end

  private
    def post_params
      params.require(:post).permit(:message, :user_id, :section_id, :image)
    end
end
