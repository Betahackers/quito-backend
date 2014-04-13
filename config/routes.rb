Rails.application.routes.draw do
  devise_for :users, path: 'session'



  api_version(:module => "V1", :path => {:value => "v1"}, :default => true) do
    root 'articles#index'
    match '/foursquare' => 'foursquare#search', via: :get
    resources :articles
    resources :locations
    resources :users
  end
end
