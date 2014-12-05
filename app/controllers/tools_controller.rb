class ToolsController < ApplicationController
  def index
    admin?
  end
end
