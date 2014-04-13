  json.location do
    json.id location.id
    json.name location.name
    json.foursquare "http://foursquare.com/venue/#{location.foursquare_id}"
    json.foursquare_id location.foursquare_id
    json.longitude location.longitude
    json.latitude location.latitude
  end
