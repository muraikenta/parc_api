class PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    post = Post.create(
      user: User.first, # replace with current_user
      content: params[:post][:content]
    )
    render json: post
  end
end
