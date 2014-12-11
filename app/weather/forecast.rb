class Forecast < Weather

  def current_weather(hash)
    hash
  end

  def self.forecast
    # get array of forecasts
    forecast = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=Seattle,us").parsed_response
    forecast_details = forecast["list"]
    forecast_details.select do |time|
      time["dt_txt"].match(/12:00:00/)
    end
  # each loop through array
    # creating Weather objects for each day
    # return array of weather objects
  end
end
