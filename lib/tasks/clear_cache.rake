task reload_cache: :environment do 
  Rails.cache.clear
  Location.all.each(&:foursquare_fields)
end
    
  
