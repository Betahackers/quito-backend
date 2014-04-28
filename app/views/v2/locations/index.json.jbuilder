json.locations @locations do |location|
  json.cache! [@cache_key, location], expires_in: 10.days do
    json.partial! location
  end
end
