json.users @users do |user|
  json.cache! [@cache_key, user], expires_in: 10.days do
    json.partial! user
  end
end