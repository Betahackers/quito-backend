json.article @articles do |article|
  json.id article.id
  json.title article.title
  json.moods article.moods
  json.content article.content
  json.author do
    json.id article.author.id
    json.first_name article.author.first_name
    json.last_name article.author.last_name
  end
  json.locations article.locations do |location|
    json.name location.name
    json.longitude location.longitude
    json.latitude location.latitude
  end
end