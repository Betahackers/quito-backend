module V2
  class LocationsController < BaseController
    load_and_authorize_resource
    
    has_scope :by_mood, type: :array
    has_scope :by_category, type: :array
    has_scope :by_user, type: :array
    has_scope :by_lat_long, using: [:lat, :long, :radius], type: :hash
    
    def index
      @locations = @locations.joins(:articles).includes(:articles, articles: :user)     
      @locations = apply_scopes(@locations)  
      @locations = @locations.paginate(page: params[:page], per_page: 200)
    end
    
  end
end
