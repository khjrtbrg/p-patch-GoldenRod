class PostsController < ApplicationController
  def index
    @admin = current_user.admin if logged_in?
  end
end
