class PostsController < ApplicationController

  def show
    @section = Section.find(params[:section_id])
    @post = @section.posts.find(params[:id])
  end

  def create
    @section = Section.find(params[:section_id])
    @post = @section.posts.create(post_params)

    if @post.save
      @user = current_user
      redirect_to section_user_path(@section, @user)
    else
      redirect_to section_path(@section)
    end
  end

  def update
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:id])
    if @post.update_attribute(:locked, params[:locked])
      redirect_to section_post_path(@section, @post)
    end
  end

  def like
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:id])
    if @post.update_attribute(:likes, params[:likes])
      redirect_to section_post_path(@section, @post)
    end
  end

  def dislike
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:id])
    if @post.update_attribute(:dislikes, params[:dislikes])
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
