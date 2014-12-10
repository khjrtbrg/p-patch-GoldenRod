class Weather
  attr_accessor :description, :icon, :humidity, :temp

  def initialize
    weather      = current_weather
    @description = weather["weather"][0]["description"]
    @icon        = weather["weather"][0]["icon"]
    @humidity    = weather["main"]["humidity"]
    @temp        = convert_temp_to_f(weather["main"]["temp"])
  end

  # Returns Seattle weather as JSON
  def request(path)
    HTTParty.get("http://api.openweathermap.org/data/2.5/#{path}?q=Seattle,us").parsed_response
  end

  def current_weather
    request("weather")
  end

  def convert_temp_to_f(temp)
    ((temp - 273.15) * 1.8000 + 32.00).to_i
  end

  ## forecast ideas?

  # def forecast
  #   request("forecast")
  # end

  # def self.forecast
  #   # get array of forecasts
  #   # each loop through array
  #   # creating Weather objects for each day
  #   # return array of weather objects
  # end

end
