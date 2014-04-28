json.article do
  json.id article.id
  json.title article.title
  json.moods article.mood_list
  json.categories article.category_list
  json.content article.content
  json.kind article.kind
  json.request_count article.request_count
  json.created_at article.created_at.to_s(:db)  
  json.updated_at article.updated_at.to_s(:db)  

  json.user do
    json.partial! article.user if article.user
  end unless controller_name == 'users'

  json.locations article.locations do |location|
    json.partial! location
  end if controller_name == 'articles'
end
