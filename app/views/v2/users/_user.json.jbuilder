json.cache! [@cach_key, user], expires_in: 10.days do
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
  json.created_at user.created_at.to_s(:db)  
  json.updated_at user.updated_at.to_s(:db)  
  

  json.articles user.articles do |article|
    json.partial! article 
  end if controller_name == 'users'

  json.locations user.locations do |location|
    json.partial! location 
  end if controller_name == 'users'
end
