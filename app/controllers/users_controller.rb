class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render :show
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)
    render :show
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    render :show
  end
end
