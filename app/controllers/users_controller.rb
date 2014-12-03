class UsersController < ApplicationController

  def index
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to root_path if @user.save
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
