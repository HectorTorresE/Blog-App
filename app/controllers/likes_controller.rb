class LikesController < ApplicationController
  def create
    @like = Like.new(author: current_user)
    @like.post_id = params[:post_id]
    redirect_to user_post_path(current_user.id, @like.post_id) if @like.save
  end

  def destroy
    likes.where(post: params[:post_id]).where(author: current_user).destroy_all
    redirect_to user_post_path(current_user.id, params[:post_id])
  end
end
