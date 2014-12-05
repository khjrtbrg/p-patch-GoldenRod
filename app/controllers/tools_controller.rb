class ToolsController < ApplicationController
  before_action :admin?

  def index
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
      redirect_to tools_path
    end
  end
end
