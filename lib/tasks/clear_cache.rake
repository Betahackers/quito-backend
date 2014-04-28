task reload_cache: :environment do 
  Rails.cache.clear

  Location.all.each(&:foursquare_fields)
  [Article, Location, User].each do |resource|
    count = resource.count
    n = 0
    while n < count
      Faraday.get "http://#{Rails.application.routes.default_url_options[:host]}/#{resource.name.downcase.pluralize}.json?offset=#{n}&limit=10"
      n += 10
    end
  end
end
    
  
