uri = URI.parse(ENV["REDISTOGO_URL"])

if Rails.env.deployment? || Rails.env.test?
  $redis = Redis.new(:host => 'localhost', :port => 6379)
elsif Rails.env.production?
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end
