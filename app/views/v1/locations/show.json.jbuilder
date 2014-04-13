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
    json.type article.article_type
    json.author do
      json.id article.author.try(:id)
      json.first_name article.author.try(:first_name)
      json.last_name article.author.try(:last_name)
    end
  end
end
