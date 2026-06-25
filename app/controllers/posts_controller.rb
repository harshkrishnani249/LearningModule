class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :comments).all

    respond_to do |format|
      format.html
      format.json do
        data = Rails.cache.fetch("api/posts/index", expires_in: 5.minutes) do
          Post.where(status: "published").includes(:user, :category).map do |post|
            { id: post.id, title: post.title, author: post.user.name, category: post.category.name }
          end
        end
        render json: data
      end
    end
  end

  def show
    @post = Post.includes(:user, comments: :user).find(params[:id])
  end
end
