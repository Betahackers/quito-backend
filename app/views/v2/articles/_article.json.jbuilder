json.article do
  json.id article.id
  json.title article.title
  json.moods article.mood_list
  json.categories article.category_list
  json.content article.content
  json.type article.article_type

  json.user do
    json.partial! article.user if article.user
  end

  json.locations article.locations do |location|
    json.partial! location
  end if controller_name == 'articles'
  
end