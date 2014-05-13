json.location do
  json.id location.id
  json.name location.name
  json.longitude location.longitude
  json.latitude location.latitude
  json.request_count location.request_count
  json.created_at location.created_at.to_s(:db)  
  json.updated_at location.updated_at.to_s(:db)  

  json.articles location.articles do |article|
    json.partial! article
  end if controller_name == 'locations'

  json.foursquare location.foursquare_fields if params[:include_foursquare] == 'true'
end
