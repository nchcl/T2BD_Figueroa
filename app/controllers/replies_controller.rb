class RepliesController < ApplicationController
  def create
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:post_id])
    @reply = @section.posts.find(params[:post_id]).replies.create(reply_params)
    redirect_to section_post_path(@section, @post)
  end

  def destroy
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:post_id])
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to section_post_path(@section, @post)
  end

  private
    def reply_params
      params.require(:reply).permit(:message, :user_id, :section_id)
    end
end
