class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to login_path
    end
  end
end
