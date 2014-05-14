redis_url = ENV["REDISCLOUD_URL"] || "redis://localhost:6379/0/quito-backend"
QuitoBackend::Application.config.cache_store = :redis_store, redis_url

# if ENV["REDISCLOUD_URL"]
#   uri = URI.parse(ENV["REDISCLOUD_URL"])
# else
#   uri = URI.parse("redis://localhost:6379/0/quito-backend")
# end
# 
# $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
