class UsersController < ApplicationController
  def show
    render json: User.find(params[:id])
  end

  def update
    user = current_user.update(
      profile: params[:profile]
    )
    render json: user
  end
end
