
module WeatherHelper
  def weather_hash
    time = DateTime.parse($redis.get("time_of_call"))
    if Time.now - time >= 60
      weather = Wunderground.new(ENV["WUNDERGROUND_KEY"]).conditions_for("WA/Seattle")
      $redis.set("temperature", weather['current_observation']['temp_f'])
      $redis.set("description", weather['current_observation']['weather'])
      $redis.set("icon", weather['current_observation']['icon_url'])
      $redis.set("time_of_call", weather['current_observation']["observation_time_rfc822"])
    end
    # w_api.conditions_for("WA/Seattle")['current_oberservation']

    # HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=seattle,wa").parsed_response
  end

  def temperature

    weather_hash
    $redis.get("temperature")
    #weather_hash['current_observation']['temp_f']
    # c = weather_hash['main']['temp'] - 273.15
    # (((c * 9) / 5) + 32).to_i
  end

  def description
    weather_hash
    $redis.get("description")
    #weather_hash['current_observation']['weather']

    # weather_hash['weather'][0]['main']
  end

  def detailed_description
    # weather_hash['weather'][0]['description']
  end

  def humidity
    # weather_hash['main']['humidity']
  end

  def wind_speed
    # weather_hash['wind']['speed']
  end

  def icon
    weather_hash
    $redis.get("icon")
    #weather_hash['current_observation']['icon_url']
    # if description == "Rain"
    #   "cloudy-with-rain.png"
    # elsif description == "Snow"
    #   "heavy-snow.png"
    # else
    #   "sunny.png"
    # end
    # weather = weather_hash['main']['weather'][0]['main']
    # if weather == "rain"
    #   "cloudy-with-rain.png"
    # else
    #   "sunny.png"
    # end
  end
end
