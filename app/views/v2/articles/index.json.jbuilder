json.articles @articles do |article|
  json.cache! [@cache_key, article], expires_in: 10.days do
    json.partial! article
  end
end