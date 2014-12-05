class PostsController < ApplicationController
  before_action :admin?

  def index
    @posts = Post.order(updated_at: :desc)
  end

  def new
    if @admin
      @post = Post.new
    else
      redirect_to posts_path
    end
  end

  def create
    if @admin
      @post = current_user.posts.create(post_params)
      if @post.save
        redirect_to posts_path
      else
        render(:new)
      end
    else
      redirect_to posts_path
    end
    # create invalid post and inspect @post!!
  end

  private

  def admin?
    @admin = current_user.admin if logged_in?
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end