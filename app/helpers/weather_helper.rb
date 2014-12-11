
module WeatherHelper

  def self.get_weather
      # time = DateTime.parse($redis.get("time_of_call"))
      # if Time.now - time >= 120
      w_api = Wunderground.new(ENV['WUNDERGROUND_API_KEY'])
      # w_api.throws_exceptions = true
      weather = w_api.conditions_for("WA/Seattle")
      $redis.set("temperature", weather['current_observation']['temp_f'])
      $redis.set("description", weather['current_observation']['weather'])
      $redis.set("icon", weather['current_observation']['icon_url'])
      $redis.set("time_of_call", weather['current_observation']["observation_time_rfc822"])
  end

  def get_weather
    time = DateTime.parse($redis.get("time_of_call"))
    if Time.now - time >= 120
      weather = Wunderground.new(ENV["WUNDERGROUND_API_KEY"]).conditions_for("WA/Seattle")

      $redis.set("temperature", weather['current_observation']['temp_f'])
      $redis.set("description", weather['current_observation']['weather'])
      $redis.set("icon", weather['current_observation']['icon_url'])
      $redis.set("time_of_call", weather['current_observation']["observation_time_rfc822"])
    end
  end
    # rescue
    #     begin
    #       w_api = Wunderground.new(ENV["WUNDERGROUND_KEY"])
    #       # w_api.throws_exceptions = true
    #       weather = w_api.conditions_for("WA/Seattle")
    #     rescue
    #       $redis.set("temperature", "unavailable")
    #       $redis.set("description", "unavailable")
    #       $redis.set("icon", nil)
    #       $redis.set("time_of_call", Time.now)
    #       return
    #     end
    #     $redis.set("temperature", weather['current_observation']['temp_f'])
    #     $redis.set("description", weather['current_observation']['weather'])
    #     $redis.set("icon", weather['current_observation']['icon_url'])
    #     $redis.set("time_of_call", weather['current_observation']["observation_time_rfc822"])
      # end


  def temperature
    # get_weather
    $redis.get('temperature')
  end

  def description
    # get_weather
    $redis.get("description")
  end

  def icon
    # get_weather
    $redis.get("icon")
  end
end
