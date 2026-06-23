class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :comments).order(created_at: :desc).limit(20)
  end

  def show
    @post = Post.includes(:user, comments: :user).find(params[:id])
  end
end
