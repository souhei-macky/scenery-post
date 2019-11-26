class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @posts = Post.where(genre_id: params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:genre_id, :title, :image, :text)
  end

end
