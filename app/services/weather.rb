class Weather

  def self.get_weather
    begin
      weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_API_KEY"]}/conditions/q/WA/seattle.json").parsed_response
    rescue
      Resque.redis.set("temperature", "unavailable")
      Resque.redis.set("description", "unavailable")
      Resque.redis.set("icon", "unavailable")
      return
    end

    Resque.redis.set("temperature", weather['current_observation']['temp_f'])
    Resque.redis.set("description", weather['current_observation']['weather'])
    Resque.redis.set("icon", weather['current_observation']['icon_url'])
    Resque.redis.set("time_of_call", Time.now)

  end

  def self.get_forecast
    forecast = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_API_KEY"]}/forecast/q/WA/seattle.json").parsed_response
    forecast_info = forecast['forecast']['simpleforecast']['forecastday']
    forecast_info.each_with_index do |day, index|
      Resque.redis.set("#{index}_forecast_icon", day['icon_url'])
      Resque.redis.set("#{index}_conditions", day['conditions'])
      Resque.redis.set("#{index}_day", day['date']['weekday_short'])
    end
    # Resque.redis.set("forecast_icon_array", icon_array)
    # Resque.redis.set("description_forecast", forecast['forecast']['simpleforecast']['forecastday'][1]['conditions'])
  end

  def temp
    Resque.redis.get("temperature")
  end

  def description
    Resque.redis.get("description")
  end

  def icon
    Resque.redis.get("icon")
  end

  def description_forecast
    Resque.redis.get("description_forecast")
  end

  def icon_array
    icon_array = []
    icon_array << Resque.redis.get("0_forecast_icon")
    icon_array << Resque.redis.get("1_forecast_icon")
    icon_array << Resque.redis.get("2_forecast_icon")
    icon_array << Resque.redis.get("3_forecast_icon")
  end

  def day_array
    day_array = []
    day_array << Resque.redis.get("0_day")
    day_array << Resque.redis.get("1_day")
    day_array << Resque.redis.get("2_day")
    day_array << Resque.redis.get("3_day")
  end

  def condition_array
    condition_array = []
    condition_array << Resque.redis.get("0_conditions")
    condition_array << Resque.redis.get("1_conditions")
    condition_array << Resque.redis.get("2_conditions")
    condition_array << Resque.redis.get("3_conditions")

  end


end
