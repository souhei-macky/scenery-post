class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    @posts = Post.all.order(created_at: :desc)
    @post = @posts[0]
    @genre = @post.genre_id
    redirect_to post_path(@genre)
  end

  def show
    @posts = Post.where(genre_id: params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:genre_id, :title, :image, :text).merge(user_id: current_user.id)
  end

end
