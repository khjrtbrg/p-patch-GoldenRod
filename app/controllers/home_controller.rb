class HomeController < ApplicationController
  def index
    @weather = Weather.new
  end
end
