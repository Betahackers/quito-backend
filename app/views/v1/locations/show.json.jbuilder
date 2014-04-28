json.location do
  json.id @location.id
  json.name @location.name
  json.foursquare "http://foursquare.com/venue/#{@location.foursquare_id}"
  json.foursquare_id @location.foursquare_id
  json.longitude @location.longitude
  json.latitude @location.latitude
  json.foursquare_fields @location.foursquare_fields
  json.articles @location.articles do |article|
    json.id article.id
    json.title article.title
    json.moods article.mood_list
    json.categories article.category_list
    json.content article.content
    json.kind article.kind
    json.user do
      json.id article.user.try(:id)
      json.first_name article.user.try(:first_name)
      json.last_name article.user.try(:last_name)
    end
  end
end
