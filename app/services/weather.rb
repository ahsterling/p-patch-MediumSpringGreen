class Weather

  def self.get_weather
    begin
      weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_API_KEY"]}/conditions/q/WA/seattle.json").parsed_response
    rescue
      $redis.set("temperature", "unavailable")
      $redis.set("description", "unavailable")
      $redis.set("icon", "unavailable")
      return
    end
    $redis.set("temperature", weather['current_observation']['temp_f'])
    $redis.set("description", weather['current_observation']['weather'])
    $redis.set("icon", weather['current_observation']['icon_url'])
    $redis.set("time_of_call", Time.now)

  end

  def temp
    $redis.get("temperature")
  end

  def description
    $redis.get("description")
  end

  def icon
    $redis.get("icon")
  end

end
