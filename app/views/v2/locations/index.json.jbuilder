# json.locations @locations do |location|
#   json.cache! [@cache_key, location], expires_in: 10.days do
#     json.partial! location
#   end
# end


json.cache! [@cache_key, @locations.cache_key], expires_in: 10.days do
  json.locations do
    json.cache_collection! @locations, expires_in: 10.days, key: @cache_key, skip_digest: true do |location|
      json.partial! location
    end
  end
end
