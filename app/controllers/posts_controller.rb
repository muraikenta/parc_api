class PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    post = current_user.posts.create(
      content: params[:post][:content],
    )
    render json: post
  end
end
