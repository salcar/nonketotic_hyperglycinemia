rails_env = ENV['RAILS_ENV'] || 'development'

if rails_env.downcase == 'production'
  $REDIS = Redis.connect(:db => 1)
else
  $REDIS = Redis.connect(:db => 1)
end

Resque.redis = $REDIS