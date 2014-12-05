class ToolsController < ApplicationController
  before_action :admin?

  def index
  end

  def new
    if @admin
      #
    else
      redirect_to tools_path
    end
  end
end
