class ToolsController < ApplicationController
  before_action :admin?

  def index
    @tools = Tool.order(created_at: :desc)
  end

  def new
    if @admin
      @tool = Tool.new
    else
      redirect_to tools_path
    end
  end

  def create
    if @admin
      @tool = Tool.new(tools_params)
      if @tool.save
        redirect_to tools_path
      else
        render :new
      end
    else
      redirect_to tools_path
    end
  end

  def show
    redirect_to tools_path
  end

  def update
    tool = Tool.find(params[:id])
    if tool.update(user_id: current_user.id)
      redirect_to tools_path
    else
      render :index
      # add flash message
    end
  end

  private

  def tools_params
    params.require(:tool).permit(:name, :image_url)
  end
end
