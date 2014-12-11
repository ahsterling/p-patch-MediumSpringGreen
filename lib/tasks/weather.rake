require 'dotenv/tasks'

task "weather" => [:environment, :dotenv] do
  puts 'getting weather ....'
  puts "Time: #{Time.now}"

  Weather.get_weather
  Weather.get_forecast
end
