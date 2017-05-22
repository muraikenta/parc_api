class UsersController < ApplicationController
  def show
    # expect params[:id] to be username
    @user = User.find_by(username: params[:id])
    render status: :not_found and return unless @user
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)
    @user.reload
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    @user.reload
    render :show, formats: 'json', handlers: 'jbuilder'
  end

  def update
    current_user.update(
      profile: params[:profile],
    )
    render json: current_user
  end
end
