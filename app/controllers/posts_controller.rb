class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(title: params[:post][:title], body: params[:post][:body])
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_param
    params.require(:post).permit(:title, :body)
  end

  def require_login
    unless user_signed_in?
      redirect_to login_path
    end
  end
end
