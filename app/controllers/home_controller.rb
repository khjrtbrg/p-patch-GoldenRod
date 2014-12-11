class HomeController < ApplicationController
  def index
    @weather   = Weather.current_weather
    @forecasts = Weather.forecast
  end
end
