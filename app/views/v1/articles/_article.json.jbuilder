json.article do
  json.id article.id
  json.title article.title
  json.moods article.mood_list
  json.categories article.category_list
  json.content article.content
  json.type article.article_type
  json.user do
    json.id article.user.id
    json.first_name article.user.first_name
    json.last_name article.user.last_name
  end
  json.locations article.locations do |location|
    json.name location.name
    json.longitude location.longitude
    json.latitude location.latitude
  end
end