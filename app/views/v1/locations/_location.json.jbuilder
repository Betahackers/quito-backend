  json.location do
    json.id location.id
    json.name location.name
    json.foursquare "http://foursquare.com/venue/#{location.foursquare_id}"
    json.foursquare_id location.foursquare_id
    json.longitude location.longitude
    json.latitude location.latitude
    if params[:include_articles]
      json.articles location.articles do |article|
        json.id article.id
        json.title article.title
        json.moods article.mood_list
        json.categories article.category_list
        json.content article.content
        json.type article.article_type
        json.user do
          json.id article.user.try(:id)
          json.first_name article.user.try(:first_name)
          json.last_name article.user.try(:last_name)
        end
      end
    end
  end
