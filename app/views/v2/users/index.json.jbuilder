# json.users @users do |user|
#   json.cache! [@cache_key, user], expires_in: 10.days do
#     json.partial! user
#   end
# end
# 

json.users do
  json.cache_collection! @users, expires_in: 10.days, key: @cache_key, skip_digest: true do |user|
    json.partial! user
  end
end