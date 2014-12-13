class HomeController < ApplicationController
  def index
    @homepage  = true
    @weather   = Weather.current_weather
    @forecasts = Weather.forecast
  end
end
