class Weather

  def self.get_weather
    weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_API_KEY"]}/conditions/q/WA/seattle.json").parsed_response

    # w_api = Wunderground.new(ENV["WUNDERGROUND_API_KEY"])
    # w_api.throws_exceptions = true
    # weather = w_api.conditions_for("WA/Seattle")
    $redis.set("temperature", weather['current_observation']['temp_f'])
    $redis.set("description", weather['current_observation']['weather'])
    $redis.set("icon", weather['current_observation']['icon_url'])
    $redis.set("time_of_call", Time.now)


  end



end
