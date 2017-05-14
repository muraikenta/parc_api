class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def follow
    @user = User.find_by(username: params[:username])
    current_user.follow!(@user)
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def unfollow
    @user = User.find_by(username: params[:username])
    current_user.unfollow!(@user)
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def update
    current_user.update(
      profile: params[:profile]
    )
    render json: current_user
  end
end
