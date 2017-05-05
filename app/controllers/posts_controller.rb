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

  def favorite
    @post = Post.find(params[:id])
    current_user.favorite!(@post)
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def unfavorite
    @post = Post.find(params[:id])
    current_user.unfavorite!(@post)
    render :show, formats: 'json', handlers: 'jbuilder'
  end
end
