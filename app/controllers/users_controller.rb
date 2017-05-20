class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def update
    current_user.update(
      profile: params[:profile],
    )
    render json: current_user
  end
end
