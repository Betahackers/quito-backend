json.first_name user.first_name
json.last_name user.last_name
json.about user.about
json.profession user.profession
json.nationality user.nationality
json.expert_in user.expert_in
json.twitter_handle user.twitter_handle
json.website_url user.website_url
json.articles do
  json.partial! user.articles
end