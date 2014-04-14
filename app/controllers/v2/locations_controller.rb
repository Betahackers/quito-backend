module V2
  class LocationsController < BaseController
    load_and_authorize_resource
    
    has_scope :by_mood
    has_scope :by_category
    has_scope :by_user
    has_scope :by_lat_long, using: [:lat, :long, :radius], type: :hash
    
    def index
      @locations = apply_scopes(@locations)      
    end
    
  end
end
