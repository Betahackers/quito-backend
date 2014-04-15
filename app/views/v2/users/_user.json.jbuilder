json.cache! [params.hash, user], expires_in: 10.minutes do
  json.id user.id
  json.first_name user.first_name
  json.last_name user.last_name
  json.about user.about
  json.profession user.profession
  json.nationality user.nationality
  json.expert_in user.expert_in
  json.twitter_handle user.twitter_handle
  json.website_url user.website_url
  json.avatar_versions user.avatar_versions
  json.avatar_url_prefix user.avatar_url_prefix
  json.avatar_url_suffix user.avatar_url_suffix

  json.articles user.articles do |article|
    json.partial! article 
  end if controller_name == 'users'

  json.locations user.locations do |location|
    json.partial! location 
  end if controller_name == 'users'
end
