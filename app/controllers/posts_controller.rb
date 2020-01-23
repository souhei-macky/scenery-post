class PostsController < ApplicationController
  def index
    @rank = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
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
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id
    redirect_to user_path(current_user.id)
  end

  def destroy
    post = Post.find(params[:id])
    binding.pry
    post.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def post_params
    params.require(:post).permit(:genre_id, :title, :image, :text).merge(user_id: current_user.id)
  end

end
