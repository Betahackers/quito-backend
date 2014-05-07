# json.articles @articles do |article|
#   json.cache! [@cache_key, article], expires_in: 10.days do
#     json.partial! article
#   end
# end

json.articles do
  json.cache_collection! @articles, expires_in: 10.days, key: @cache_key, skip_digest: true do |article|
    json.partial! article
  end
end