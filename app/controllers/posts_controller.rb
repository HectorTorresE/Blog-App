class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(created_at: :asc)
  end

  def show
    @post = Post.where(author_id: params[:user_id]).order(created_at: :asc).find(params[:id])
    @is_liked = @post.liked?(current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.commentscounter = 0
    @post.likescounter = 0
    if @post.valid? && @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
