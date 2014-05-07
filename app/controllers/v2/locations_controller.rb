module V2
  class LocationsController < BaseController
    has_scope :by_mood, type: :array
    has_scope :by_category, type: :array
    has_scope :by_user, type: :array
    has_scope :by_lat_long, using: [:lat, :long, :radius], type: :hash
    
    
    def index      
      @locations = apply_scopes(@locations)  
      # Use eager load to avoid including all users when locations are filtered by a specific user.
      @locations = @locations.joins(articles: :user).eager_load(:articles, articles: :user)      
            
      ## Geocoder and will_paginate/kaminari have an issue. tracked here: https://github.com/alexreisner/geocoder/issues/630
      ## Disabled kaminari for now
      # @locations = @locations.page(params[:page]).per(parms[:per_page])
      ## For now do it as an array
      params[:offset] ||= 0
      params[:limit] ||= 200
      @locations = @locations.drop(params[:offset].to_i).take(params[:limit].to_i)
    end
    
  end
end
