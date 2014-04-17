json.cache! [@cach_key, article], expires_in: 10.minutes do
  json.article do
    json.id article.id
    json.title article.title
    json.moods article.mood_list
    json.categories article.category_list
    json.content article.content
    json.type article.article_type
    json.created_at article.created_at
    json.updated_at article.updated_at

    json.user do
      json.partial! article.user if article.user
    end unless controller_name == 'users'

    json.locations article.locations do |location|
      json.partial! location
    end if controller_name == 'articles'
  end
end