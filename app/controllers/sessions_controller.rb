class SessionsController < ApplicationController

  def new
  end

  def create
    if find_user && authenticate_password
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find_by(email: params[:email])
  end

  def authenticate_password
    if @user.password == params[:password]
      session[:user_id] = @user.id
      # @user
    end
  end

end
