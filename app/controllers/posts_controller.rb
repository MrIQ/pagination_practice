class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at).page(params[:page]).per_page(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    return render(:new) unless @post.save
    redirect_to posts_path
  end
end
