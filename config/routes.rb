Rails.application.routes.draw do
  devise_for :users, path: 'd'

  root 'articles#index'


  api_version(:module => "V1", :path => {:value => "v1"}, :default => true) do
    match '/foursquare' => 'foursquare#index', via: :get
    match '/foursquare/list_venues' => 'foursquare#list_venues', via: :post
    resources :articles
    resources :users
  end
end
