class Weather
  attr_accessor :description, :icon, :humidity, :temp

  def initialize(weather_data)
    weather      = weather_data
    @date_time   = Time.at(weather["dt"])
    @description = weather["weather"][0]["description"]
    @icon        = "http://openweathermap.org/img/w/#{weather['weather'][0]['icon']}.png"
    @humidity    = weather["main"]["humidity"]
    @temp        = convert_temp_to_f(weather["main"]["temp"])
  end

  def self.request(path)
    HTTParty.get("http://api.openweathermap.org/data/2.5/#{path}?q=Seattle,us").parsed_response
  end

  def self.current_weather
    weather_hash = request("weather")
    Weather.new(weather_hash)
  end

  def self.forecast
    forecast_data  = request("forecast")["list"]
    forecasts = forecast_data.select do |weather_hash|
      weather_hash["dt_txt"].match(/12:00:00/)
    end
    forecasts.map { |weather_hash| Weather.new(weather_hash) }
  end

  def convert_temp_to_f(temp)
    ((temp - 273.15) * 1.8000 + 32.00).to_i
  end
end
