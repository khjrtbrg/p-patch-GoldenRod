class ToolsController < ApplicationController
  before_action :admin?

  def index
    @tools = Tool.order(updated_at: :desc)
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
      @tool = current_user.tools.new(tools_params)
      if @tool.save
        redirect_to tools_path
      else
        render :new
      end
    else
      redirect_to tools_path
    end
  end

  private

  def tools_params
    params.require(:tool).permit(:name, :image_url)
  end
end
