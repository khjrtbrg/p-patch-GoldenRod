class UsersController < ApplicationController

  def index
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save ? redirect_to(root_path) : render(:new)
  end

  private

  def user_params
    params.require(:user).permit(
      :user_name,
      :email,
      :password,
      :password_confirmation
      )
  end
end
