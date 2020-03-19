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

  def update
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:id])
    if @post.update_attribute(:locked, params[:locked])
      redirect_to section_post_path(@section, @post)
    end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to section_path(@section)
  end

  private
    def post_params
      params.require(:post).permit(:message, :user_id, :section_id, :image)
    end
end
