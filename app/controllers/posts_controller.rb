class PostsController < ApplicationController
  before_action :admin?

  def index

  end

  def new
    redirect_to posts_path unless @admin
  end

  private

  def admin?
    @admin = current_user.admin if logged_in?
  end
end
