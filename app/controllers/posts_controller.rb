class PostsController < ApplicationController
  before_action :admin?

  def index

  end

  def new
    if @admin
      @post = Post.new
      @author = current_user.user_name
    else
      redirect_to posts_path
    end
  end

  def create
    # create invalid post and inspect @post!!
  end

  private

  def admin?
    @admin = current_user.admin if logged_in?
  end
end
