json.cache! [@cach_key, location], expires_in: 10.minutes do
  json.location do
    json.id location.id
    json.name location.name
    json.longitude location.longitude
    json.latitude location.latitude
    
    json.articles location.articles do |article|
      json.partial! article unless params[:by_user] && !params[:by_user].include?(article.user_id.to_s)
    end if controller_name == 'locations'
  
    json.foursquare location.foursquare_fields if params[:include_foursquare] == 'true'
  end
end
