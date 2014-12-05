
module WeatherHelper
  def weather_hash
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=seattle").parsed_response
  end

  def temperature
    c = weather_hash['main']['temp'] - 273.15
    (((c * 9) / 5) + 32).to_i
  end

  def description
    weather_hash['weather'][0]['main']
  end

  def detailed_description
    weather_hash['weather'][0]['description']
  end
end
