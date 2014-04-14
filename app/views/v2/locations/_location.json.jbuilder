json.location do
  json.id location.id
  json.name location.name
  json.longitude location.longitude
  json.latitude location.latitude
    
  json.articles location.articles do |article|
    json.partial! article
  end if controller_name == 'locations'
  
  json.foursquare location.foursquare_fields if params[:include_foursquare] == 'true'
end
