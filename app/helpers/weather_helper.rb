
module WeatherHelper


  def format_current_temp
    # get_weather
    temp = Resque.redis.get('temperature')
    html = "<span class='temp'>Current temperature: #{temp}<span class='degree-symbol'>°</span></span>"
    html.html_safe

  end




end
